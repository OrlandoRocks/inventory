class AddAddressToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :suburb, :string
    add_reference :clients, :state, foreign_key: true
    add_reference :clients, :city, foreign_key: true
  end
end
