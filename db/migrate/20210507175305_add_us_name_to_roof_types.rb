class AddUsNameToRoofTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :roof_types, :us_name, :string
  end
end
