class BranchSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :city_id, :city, :company_id,
             :manager_id, :manager, :city_id, :state_id, :state, :code, :departments, :items

  def items
    object.items.as_json(except: :image) if object.items
  end

end




















