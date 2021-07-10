class AddFacturifyIdToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :facturify_id, :string
  end
end
