class AddCurrendCompanyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_company, :integer
  end
end
