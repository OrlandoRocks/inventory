class AddPaymentToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :payment_type, :integer
    add_reference :items, :fiscal_voucher, foreign_key: true
  end
end
