class AddUsNameToFenderTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :fender_types, :us_name, :string
  end
end
