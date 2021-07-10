# == Schema Information
#
# Table name: providers
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  contact     :string
#  phone       :string
#  email       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Provider < ApplicationRecord
end
