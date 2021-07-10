class AddUsoCfdiToFiscalVouchers < ActiveRecord::Migration[5.2]
  def change
    add_column :fiscal_vouchers, :cfdi, :string
  end
end
