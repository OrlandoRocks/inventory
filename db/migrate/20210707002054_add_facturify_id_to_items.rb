class AddFacturifyIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :facturify_id, :string
  end
end
