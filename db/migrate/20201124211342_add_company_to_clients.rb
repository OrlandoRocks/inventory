class AddCompanyToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :company, :string
  end
end
