# == Schema Information
#
# Table name: pull_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  model_part :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PullType < ApplicationRecord
  has_many :trailer_category
  accepts_nested_attributes_for :trailer_category
end
