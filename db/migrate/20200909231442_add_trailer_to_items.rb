class AddTrailerToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :trailer, foreign_key: true
  end
end
