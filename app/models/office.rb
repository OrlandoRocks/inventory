# == Schema Information
#
# Table name: offices
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  department_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Office < ApplicationRecord
  belongs_to :department
  belongs_to :user
end
