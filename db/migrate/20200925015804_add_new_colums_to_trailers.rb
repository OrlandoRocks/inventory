class AddNewColumsToTrailers < ActiveRecord::Migration[5.2]
  def change
    add_reference :trailers, :category, index: true, foreign_key: true
    add_reference :trailers, :sub_category, index: true, foreign_key: true
    add_column :trailers, :image, :string
  end
end
