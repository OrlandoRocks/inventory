# == Schema Information
#
# Table name: items
#
#  id                         :integer          not null, primary key
#  name                       :string
#  description                :text
#  model                      :string
#  serial_number              :string
#  purchased_date             :date
#  in_service_date            :date
#  time_unit_service          :integer
#  time_quantity_service      :decimal(, )
#  price                      :decimal(, )
#  time_unit_depreciation     :integer
#  time_quantity_depreciation :decimal(, )
#  sub_category_id            :integer
#  provider_id                :integer
#  department_id              :integer
#  user_id                    :integer
#  brand_id                   :integer
#  status_item_id             :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  code                       :string
#  image                      :string
#  maintenance_date           :date
#  maintenance_done           :boolean
#  branch_id                  :integer
#  category_id                :integer
#  to_assing                  :boolean
#  sale_price                 :decimal(, )
#  remission                  :string
#  accessory                  :string
#  acquisition_date           :date
#  trailer_id                 :bigint
#  payment_type               :integer
#  fiscal_voucher_id          :bigint
#  client_id                  :bigint
#  advance_payment            :decimal(, )
#  status_shipping_id         :bigint
#  color                      :string
#  trailer_length_id          :bigint
#  trailer_height_id          :bigint
#  ramp_type_id               :bigint
#  redila_type_id             :bigint
#  trailer_type_id            :bigint
#  floor_type_id              :bigint
#  capacity_id                :bigint
#  duck_tail                  :boolean
#  gooseneck                  :boolean
#  trailer_width_id           :bigint
#  color_id                   :bigint
#  hydraulic_jack_id          :bigint
#  pull_type_id               :bigint
#  brake_type_id              :bigint
#  reinforcement_type_id      :bigint
#  fender_type_id             :bigint
#  turn_type_id               :bigint
#  divition_type_id           :bigint
#  suspension_type_id         :bigint
#  roof_type_id               :bigint
#  categories_description     :text
#  seller_percentage          :decimal(, )
#  planet_percentage          :decimal(, )
#  branch_percentage          :decimal(, )
#

class Item < ApplicationRecord
  #belongs_to :category, optional: true
  belongs_to :provider, optional: true
  belongs_to :department, optional: true
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :trailer, optional: true
  belongs_to :trailer_type, optional: true
  belongs_to :trailer_length, optional: true
  belongs_to :trailer_height, optional: true
  belongs_to :trailer_width, optional: true
  belongs_to :ramp_type, optional: true
  belongs_to :redila_type, optional: true
  belongs_to :floor_type, optional: true
  belongs_to :capacity, optional: true
  belongs_to :brake_type, optional: true
  belongs_to :color, optional: true
  belongs_to :divition_type, optional: true
  belongs_to :fender_type, optional: true
  belongs_to :hydraulic_jack, optional: true
  belongs_to :pull_type, optional: true
  belongs_to :reinforcement_type, optional: true
  belongs_to :roof_type, optional: true
  belongs_to :suspension_type, optional: true
  belongs_to :turn_type, optional: true
  belongs_to :status_item
  belongs_to :status_shipping, optional: true
  belongs_to :fiscal_voucher, optional: true
  belongs_to :client, optional: true
  belongs_to :direct_branch, class_name: 'Branch', foreign_key: 'branch_id', optional: true

  has_one :direct_company, through: :direct_branch, source: :company
  has_one :branch, through: :department
  has_one :company, through: :branch
  has_one :sub_category, through: :trailer
  has_one :category, through: :sub_category
  has_one :user_department, :through => :user, :source => :department

  has_many :item_files, dependent: :destroy
  has_many :items_maintenances, dependent: :destroy
  accepts_nested_attributes_for :item_files
  accepts_nested_attributes_for :items_maintenances

  # enum payment_type: [:cash, :deposit]
  enum file_type: [ :photo, :assignment_signature, :invoice, :guarantee_policy, :other]
  enum time_unit: [ :day, :month, :year]
  enum item_type: [ :planet, :remolques ]

  audited except: :image

  scope :next_maintenances, -> { order('maintenance_date ASC') }

  scope :unsold, -> { where(status_item_id: 2) }

  has_associated_audits

  # mount_uploader :image, ItemUploader
  has_one_attached :image

  # validate :price_gt_zero
  # validates :name ,:description  , presence: true
  #


  #validates :time_unit_service, :time_quantity_service, :purchased_date, :name, presence: true
  # validates_processing_of :image
  # validate :image_size_validation

  # before_save :set_maintenance_date
  # before_create :set_maintenance_done
  # before_update :calculate_maintenance_date

  # delegate :name, to: :brand, prefix: true, allow_nil: true
  # delegate :name, to: :provider, prefix: true, allow_nil: true
  # delegate :name, to: :sub_category, prefix: true, allow_nil: true
  # delegate :name, to: :category, prefix: true, allow_nil: true
  delegate :name, to: :status_item, prefix: true, allow_nil: true

  attr_accessor :quantity, :skip_create_copies

  after_create :create_copy_of_items, unless: :skip_create_copies

  include Rails.application.routes.url_helpers

  def price_total
    self.price  * ( 1 + (self.branch.nil? ? 1 : self.branch.try(:fleet_cost)) /100 ) if self.price
  end

  def image_base64
    Base64.encode64(File.read(ActiveStorage::Blob.service.path_for(self.image.key))) if self.image.attached?
  end

  def image_path
    rails_blob_path(self.image, only_path: true) if self.image.attached?
  end

  def self.set_without_maintenance
    Item.all.each do |item|
      if Date.today > item.maintenance_date
        item.update_attribute('maintenance_done', false)
      end
    end
  end

  def responsible
    if self.user
      self.user
    elsif self.department.try(:manager)
      self.department.manager
    elsif self.branch.try(:user)
      self.branch.user
    elsif self.company.try(:user)
      self.company.user
    elsif self.direct_branch.try(:user)
      self.direct_branch.user
    elsif self.direct_company.try(:user)
      self.direct_company.try(:user)
    end
  end


  def self.to_csv
    attributes = %w{id serial_number model categories_description}
    CSV.generate(headers: false) do |csv|
      # csv << attributes

      where(item_type:'remolques').each do |item|
        csv << attributes.map{ |attr| item.send(attr) }
      end
    end
  end

  private
  def image_size_validation
    errors[:image] << "Debe de ser de tamaño menor a 5 MB" if image.size > 5.megabytes
  end

  def set_maintenance_done
    self.maintenance_done = true
  end

  def set_maintenance_date
    if self.changes.length > 0 and (self.changes[:time_unit_service] or self.changes[:time_quantity_service])
      time_unit = Item.time_units.key(self.time_unit_service)
      time_quantity = self.time_quantity_service.to_i
      self.maintenance_date = ((Date.today) + (time_quantity.send(time_unit)))
    end
  end

  def calculate_maintenance_date
    if self.changes.length > 0 and (self.changes[:maintenance_done] and self.changes[:maintenance_done][1] == true)
      time_unit = Item.time_units.key(self.time_unit_service)
      time_quantity = self.time_quantity_service.to_i
      self.maintenance_date = ((Date.today) + (time_quantity.send(time_unit)))
    end
  end

  scope :items_assigned, -> {
    joins("LEFT JOIN users ON users.id = items.user_id LEFT JOIN departments ON departments.id = items.department_id")
        .select("items.*")
  }

  def self.fcm_push_notification message, seller_name, user_token
    fcm_client = FCM.new("AAAAPMlsVAc:APA91bGSTjpLnvba_GAVSoAfPLC5xgml5ZpsT-MPYB7YXDGaCW0ObspNUBR_YDdZjpobwhMoMd-_r7UwYCc7WalbH3wXnKeMqu36ktAt2x_12-XH0hJMmWpE554uiV0rhQq41VD1Idrn")

# See https://firebase.google.com/docs/cloud-messaging/http-server-ref for all available options.
    options = {   priority: 'high',
                  data: {message:message, icon: nil},
                  notification: {
                      title: "Se Vendio Un remolque",
                      body: "El vendedor #{seller_name} ha echo una venta",
                      sound: 'default'
                  }
    }
    response = fcm_client.send(user_token, options)


  end

  #require 'CSV'
  def self.import(file)

    CSV.foreach(file.path, headers: true, :encoding => 'ISO-8859-1') do |row|

      product_hash = row.to_hash # exclude the price field

      status_item_id = StatusItem.where('upper(name)=?', product_hash["ESTATUS"]).first.try(:id)

      subcategory_id = SubCategory.where('upper(name)=?', product_hash["CATEGORIA/SUBCATEGORIA"].to_s.partition('/').last).first.try(:id)

      branch_id = Branch.where('upper(name)=?', product_hash["DEPARTAMENTO/SUCURSAL"].to_s.partition('/').first).first.try(:id)

      department_id = Department.where('upper(name)=?',product_hash["DEPARTAMENTO/SUCURSAL"].to_s.partition('/').last).first.try(:id)


      p '************product_hash["ESTATUS"]'
      p product_hash["ESTATUS"]
      p status_item_id

      p '************product_hash["SUBCATEGORIA"]'
      p product_hash["CATEGORIA/SUBCATEGORIA"].to_s.partition('/').last
      p subcategory_id


      p '************product_hash["DEPARTAMENTO"]'
      p product_hash["DEPARTAMENTO/SUCURSAL"].to_s.partition('/').first
      p branch_id


      p '************product_hash["SUCURSAL"]'
      p product_hash["DEPARTAMENTO/SUCURSAL"].to_s.partition('/').last
      p department_id


      if department_id.present?
        user_id = Department.where(id: department_id).first.try(:manager_id)
        p '************DEPARTAMENTO'
        p user_id
      elsif branch_id.present?
        user_id = Branch.where(id: branch_id).first.try(:manager_id)
        p '************SUCURSAL'
        p user_id
      end




       # Item.create(name: product_hash["NOMBRE"], description: product_hash["DESCRIPCION"] , model: product_hash["MODELO"],
       #             serial_number: product_hash["NUM. SERIE"], price: product_hash["PRECIO"], status_item_id: status_item_id,
       #             sub_category_id: subcategory_id , department_id: department_id , branch_id: branch_id,
       #             user_id: user_id)

      # product = Product.where(id: product_hash["id"])
      #
      # if product.count == 1
      #   product.first.update_attributes(product_hash.except("price")) # exclude the price field.
      # else
      #   Product.create!(product_hash)
      # end # end if !product.nil?
    end # end CSV.foreach

    # spreadsheet = Roo::Spreadsheet.open(file.path)
    #
    # spreadsheet.each do |row|
    #   p row
    # end
    #
    #
    # header = spreadsheet.row(1)
    # (2..spreadsheet.last_row).each do |i|
    #   row = Hash[[header, spreadsheet.row(i)].transpose]
    #   p "**RENGLON**"
    #   p row
    #   product = find_by(id: row["id"]) || new
    #   product.attributes = row.to_hash
    #   product.save!
    # end
  end

  def price_gt_zero
    if self.price <= 0
      self.errors.add(:price, "El Valor de Adquisicion debe ser mayor a cero")
    end
  end

  def create_copy_of_items
    return if self.quantity.nil? or self.quantity.empty?
    quantity_of_copies = self.quantity.to_i - 1
    quantity_of_copies.times do
      attrs = self.attributes.select {|key| !%w(id created_at updated_at).include?(key)}
      item = Item.new(attrs)
      item.skip_create_copies = true
      item.save
    end
  end

end
