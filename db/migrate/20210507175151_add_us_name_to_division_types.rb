class AddUsNameToDivisionTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :divition_types, :us_name, :string
  end
end
