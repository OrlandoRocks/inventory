class AddUsNameToRampTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :ramp_types, :us_name, :string
  end
end
