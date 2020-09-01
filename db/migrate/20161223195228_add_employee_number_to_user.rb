class AddEmployeeNumberToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :employee_number, :integer
  end
end
