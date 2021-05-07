class AddUsNameToSuspensionTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :suspension_types, :us_name, :string
  end
end
