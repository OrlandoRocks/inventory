class AddKeyToTrailerCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :trailer_categories, :key, :string
  end
end
