class Category < ApplicationRecord

  has_many :sub_categories, -> { order('name') }


  belongs_to :company , :class_name => 'Company' , foreign_key: 'company_id'
  belongs_to :trailer

  validates :name,:company_id, presence: true


end
