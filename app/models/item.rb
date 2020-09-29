class Item < ApplicationRecord
  belongs_to :sub_category, optional: true
  #belongs_to :category, optional: true
  belongs_to :provider, optional: true
  belongs_to :department, optional: true
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :trailer, optional: true
  belongs_to :status_item
  belongs_to :fiscal_voucher, optional: true
  belongs_to :client, optional: true
  belongs_to :direct_branch, class_name: 'Branch', foreign_key: 'branch_id'
  has_one :direct_company, through: :direct_branch, source: :company
  has_one :branch, through: :department
  has_one :company, through: :branch
  has_one :category, through: :sub_category


  has_many :item_files, dependent: :destroy
  has_many :items_maintenances, dependent: :destroy
  accepts_nested_attributes_for :item_files
  accepts_nested_attributes_for :items_maintenances

  scope :next_maintenances, -> { order('maintenance_date ASC') }

  has_associated_audits

  # mount_uploader :image, ItemUploader
  has_one_attached :image

  # validates :name ,:description  , presence: true


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

  enum file_type: [ :photo, :assignment_signature, :invoice, :guarantee_policy, :other]
  # enum payment_type: [ :cash, :deposito]
  enum time_unit: [ :day, :month, :year]

  audited except: :image

  scope :items_assigned, -> {
    joins("LEFT JOIN users ON users.id = items.user_id LEFT JOIN departments ON departments.id = items.department_id")
        .select("items.*")
  }


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

end
