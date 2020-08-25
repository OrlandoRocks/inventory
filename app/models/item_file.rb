class ItemFile < ApplicationRecord
  belongs_to :item

  mount_uploader :file, ItemFileUploader

  audited associated_with: :item


end
