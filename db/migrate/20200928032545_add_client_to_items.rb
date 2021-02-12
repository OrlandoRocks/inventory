class AddClientToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :advance_payment, :decimal
  end
end
