class ItemFile < ActiveRecord::Base
  belongs_to :item

  mount_uploader :file, ItemFileUploader

  audited associated_with: :item


end
