class AddUsNameToBrakeTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :brake_types, :us_name, :string
  end
end
