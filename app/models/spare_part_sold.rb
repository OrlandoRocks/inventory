class SparePartSold < ApplicationRecord
  belongs_to :client
  belongs_to :user
  belongs_to :spare_part
  belongs_to :fiscal_voucher

end
