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

class FiscalVoucherSerializer < ActiveModel::Serializer
  attributes :id, :name, :status
end
