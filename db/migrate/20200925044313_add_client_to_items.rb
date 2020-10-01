class AddClientToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :client, foreign_key: true
  end
end
