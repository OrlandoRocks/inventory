class AddStatusShippingToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :status_shipping, foreign_key: true
  end
end
