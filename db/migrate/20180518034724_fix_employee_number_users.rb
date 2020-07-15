class FixEmployeeNumberUsers < ActiveRecord::Migration
  def change
    change_column :users, :employee_number, :string
  end
end
