class ItemsMaintenance < ApplicationRecord
  belongs_to :item
  belongs_to :maintenance

  mount_uploader :file, ItemFileUploader

  audited associated_with: :item
end
