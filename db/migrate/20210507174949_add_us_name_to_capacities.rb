class AddUsNameToCapacities < ActiveRecord::Migration[5.2]
  def change
    add_column :capacities, :us_name, :string
  end
end
