class AddUsNameToFloorTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :floor_types, :us_name, :string
  end
end
