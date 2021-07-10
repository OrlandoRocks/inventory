class CreateSparePartSolds < ActiveRecord::Migration[5.2]
  def change

    create_table :spare_part_solds do |t|
      t.references :client, foreign_key: true
      t.references :user, foreign_key: true
      t.references :spare_part, foreign_key: true
      t.decimal :quantity
      t.decimal :unit_sale_price
      t.integer :payment_type
      t.references :fiscal_voucher, foreign_key: true
      t.decimal :advance_payment

      t.timestamps
    end
  end
end
