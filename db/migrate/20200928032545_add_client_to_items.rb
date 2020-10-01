class AddClientToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :client, index: true, foreign_key: true
    add_column :items, :advance_payment, :decimal
  end
end
