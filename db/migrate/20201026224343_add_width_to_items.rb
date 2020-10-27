class AddWidthToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :trailer_width, foreign_key: true
  end
end
