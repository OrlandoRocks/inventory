class FixStrEmployeeNumberToIntEmployeeNumber < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :employee_number, 'integer USING CAST(employee_number AS integer)'
  end
end
