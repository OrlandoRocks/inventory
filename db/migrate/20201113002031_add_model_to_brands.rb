class AddModelToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :model_part, :string
    add_column :brands, :status, :boolean
  end
end
