# == Schema Information
#
# Table name: permission_roles
#
#  id            :integer          not null, primary key
#  role_id       :integer
#  permission_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PermissionRole < ApplicationRecord
  belongs_to :role
  belongs_to :permission
end
