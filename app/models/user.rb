# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  role_id                :integer
#  first_name             :string
#  last_name              :string
#  maiden_name            :string
#  username               :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ApplicationRecord
  # Include defaults devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable #, :confirmable

  validates :password, presence: true, on: [:create]
  # validates :employee_number, presence: true
  validates :first_name, presence: true
  # validates :current_company,
  #            presence: true,
  #            if: Proc.new { |u| Role.where(key: %w(admin_empresa)).include?(u.role_id) }


  #validates :current_company, presence: true, if: :current_company_nil?


  def current_company_nil?
    !Role.where(id: role_id).last.key.exclude?('admin')
    p '<<<<<<<<<'
    p role_id
  end

  # validates :employee_number,
  #           presence: true,
  #           uniqueness: true,
  #           if: Proc.new { |u| Role.where(key: %w(empleado_sin_acceso)).include?(u.role_id) }




  attr_accessor :current_password

  # has_attached_file :avatar, styles: {thumb: '400x400#', medium: '150x150#', small: '60x60#'},
  #                   default_url: ->(attachment) { ActionController::Base.helpers.asset_path('user_image.png') }
  # validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/jpg image/png image/gif)
  # validates_attachment_size :avatar, less_than: 5.megabytes

  mount_uploader :avatar, AvatarUploader
  mount_uploader :received_file, FileUploader

  belongs_to :role
  belongs_to :department

  has_one :branch, through: :department
  has_one :company, through: :branch

  has_many :companies, foreign_key: :user_id
  has_many :branches, foreign_key: :manager_id
  has_many :items
  has_many :users_work_articles
  has_many :work_articles, through: :users_work_articles

  delegate :name, to: :role, prefix: true, allow_nil: true
  delegate :name, to: :department, prefix: true

  before_create :set_default_role
  before_destroy :last_user_god?





=begin
  validates_presence_of :role_id, :email, :first_name, :last_name, :maiden_name, :username
  validates :username, length: {minimum: 4, maximum: 25},
            format: {with: /(^[a-z0-9_\.]+$)/}
  validates :first_name, :last_name, :maiden_name, format: {with: /(^[a-zA-Z\sáéíóúü]+$)/}
=end
  scope :admins, -> { where(role_id: Role.find_by_key('admin').try(:id)) }
  scope :admins_company, -> { where(role_id: Role.find_by_key('admin_empresa').try(:id)) }
  scope :admins_branch, -> { where(role_id: Role.find_by_key('admin_sucursal').try(:id)) }
  scope :admins_department, -> { where(role_id: Role.find_by_key('admin_departamento').try(:id)) }

  def god?
    role and role.key == 'god'
  end

  def admin?
    role and role.key == 'admin'
  end

  def admin_company?
    role and role.key == 'admin_empresa'
  end

  def admin_branch?
    role and role.key == 'admin_sucursal'
  end

  def admin_department?
    role and role.key == 'admin_departamento'
  end

  def employee?
    role and %w(empleado empleado_sin_acceso).include? role.key
  end

  def full_name
    "#{self.first_name} #{self.last_name} #{self.maiden_name}"
  end

  def first_name=(s)
    super s.titleize
  end

  def last_name=(s)
    super s.titleize
  end

  def maiden_name=(s)
    super s.titleize unless s.nil?
  end

  def users_work_articles_assigned
    users_work_articles.where(delivery_status: nil)
  end

  def unassigned_items
    self.department.items.where('user_id != ? or user_id IS NULL', self.id)
  end

  private
  def set_default_role
    self.role ||= Role.find_by_key('default')
  end

  def last_user_god?
    if self.role.key == 'god' and User.where(role_id: Role.find_by(key: 'god').id).count == 1
      errors.add(:base, I18n.t('devise.registrations.one_user_god'))
      false
    end
  end

  ransacker :employee_number do
    Arel.sql("to_char(\"#{table_name}\".\"employee_number\", '99999')")
  end

end
