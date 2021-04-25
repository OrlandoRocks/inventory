# == Schema Information
#
# Table name: branches
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  city_id     :integer
#  company_id  :integer
#  manager_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  state_id    :integer
#  code        :string
#  last_code   :integer
#  fleet_cost  :decimal(, )      default(0.0)
#

class BranchSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :city_id, :city, :company_id,
             :manager_id, :manager, :city_id, :state_id, :state, :code, :departments, :items, :fleet_cost


  def items
    object.items.as_json(except: :image) if object.items
  end

end




















