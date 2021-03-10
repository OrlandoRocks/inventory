# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  role_id                :integer
#  first_name             :string
#  last_name              :string
#  maiden_name            :string
#  username               :string
#  avatar                 :string
#  department_id          :integer
#  employee_number        :integer
#  received_file          :string
#  current_company        :integer
#  token                  :string
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :role_id, :first_name, :last_name, :maiden_name, :username, :department_id, :employee_number,
             :current_company, :department, :branch, :confirmation_token, :token
end
