class AddAdvanceToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :client, index: true, foreign_key: true
  end
end
