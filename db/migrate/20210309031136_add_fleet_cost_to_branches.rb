class AddFleetCostToBranches < ActiveRecord::Migration[5.2]
  def change
    add_column :branches, :fleet_cost, :decimal, default:0
  end
end
