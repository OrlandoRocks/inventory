class Category < ActiveRecord::Base

  has_many :sub_categories, -> { order('name') }


  belongs_to :company , :class_name => 'Company' , foreign_key: 'company_id'

  validates :name,:company_id, presence: true


end
