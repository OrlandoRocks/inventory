class AddAsingToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :to_assing, :boolean
  end
end
