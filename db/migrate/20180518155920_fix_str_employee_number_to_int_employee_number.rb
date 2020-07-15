class FixStrEmployeeNumberToIntEmployeeNumber < ActiveRecord::Migration
  def change
    change_column :users, :employee_number, 'integer USING CAST(employee_number AS integer)'
  end
end
