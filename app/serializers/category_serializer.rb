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

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status
end
