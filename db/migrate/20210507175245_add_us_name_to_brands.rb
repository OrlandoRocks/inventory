class AddUsNameToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :us_name, :string
  end
end
