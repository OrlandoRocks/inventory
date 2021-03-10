# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  logo        :string
#  manager     :string
#  address     :string
#  phone       :string
#  email       :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Company < ApplicationRecord


  mount_uploader :logo, LogoUploader

  belongs_to :user, optional: true
  has_many :branches

  has_many :category

end
