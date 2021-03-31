# == Schema Information
#
# Table name: item_files
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  file        :string
#  file_type   :integer
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ItemFile < ApplicationRecord
  belongs_to :item

  # mount_uploader :file, ItemFileUploader

  has_one_attached :file

  audited associated_with: :item


end
