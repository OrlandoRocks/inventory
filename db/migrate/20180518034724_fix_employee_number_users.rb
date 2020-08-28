class FixEmployeeNumberUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :employee_number, :string
  end
end
