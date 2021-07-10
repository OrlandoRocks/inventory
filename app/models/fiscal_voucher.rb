# == Schema Information
#
# Table name: fiscal_vouchers
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FiscalVoucher < ApplicationRecord
  has_many :trailer_category
  accepts_nested_attributes_for :trailer_category
end
