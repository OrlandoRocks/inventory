class Client < ApplicationRecord

  belongs_to :city , :class_name => 'City' , foreign_key: 'city_id'

  has_one :state, through: :city

  has_many :item

  has_associated_audits

  audited


  def full_name
    "#{self.name} #{self.last_name} #{self.maiden_name}"
  end
end
