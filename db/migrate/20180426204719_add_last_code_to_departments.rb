class AddLastCodeToDepartments < ActiveRecord::Migration[5.0]
  def change
    add_column :departments, :last_code, :string
  end
end
