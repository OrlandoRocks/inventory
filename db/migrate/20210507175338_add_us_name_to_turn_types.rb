class AddUsNameToTurnTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :turn_types, :us_name, :string
  end
end
