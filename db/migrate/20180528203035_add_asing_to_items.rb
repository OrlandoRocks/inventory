class AddAsingToItems < ActiveRecord::Migration
  def change
    add_column :items, :to_assing, :boolean
  end
end
