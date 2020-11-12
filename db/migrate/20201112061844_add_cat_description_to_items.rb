class AddCatDescriptionToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :categories_description, :text
  end
end
