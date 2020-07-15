class AddLastCodeToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :last_code, :string
  end
end
