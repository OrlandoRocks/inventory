class AddUsNameToRedilaTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :redila_types, :us_name, :string
  end
end
