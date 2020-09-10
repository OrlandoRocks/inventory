class ItemFile < ApplicationRecord
  belongs_to :item

  # mount_uploader :file, ItemFileUploader

  has_one_attached :file

  audited associated_with: :item


end
