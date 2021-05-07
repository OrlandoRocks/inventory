class AddUsNameToHydraulicJacks < ActiveRecord::Migration[5.2]
  def change
    add_column :hydraulic_jacks, :us_name, :string
  end
end
