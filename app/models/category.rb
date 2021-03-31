# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  status      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#

class Category < ApplicationRecord

  has_many :sub_categories, -> { order('name') }


  # belongs_to :company , :class_name => 'Company' , foreign_key: 'company_id'
  #
  # validates :name,:company_id, presence: true


end
