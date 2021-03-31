# == Schema Information
#
# Table name: items_maintenances
#
#  id             :integer          not null, primary key
#  item_id        :integer
#  file           :string
#  maintenance_id :integer
#  description    :text
#  price          :decimal(, )
#  provider       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ItemsMaintenance < ApplicationRecord
  belongs_to :item
  belongs_to :maintenance

  mount_uploader :file, ItemFileUploader

  audited associated_with: :item
end
