class AddEmployeeNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :employee_number, :integer
  end
end
