class CreateFiscalVouchers < ActiveRecord::Migration[5.2]
  def change
    create_table :fiscal_vouchers do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
