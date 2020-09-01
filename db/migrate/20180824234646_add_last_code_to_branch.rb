class AddLastCodeToBranch < ActiveRecord::Migration[5.0]
  def change
    add_column :branches, :last_code, :int
  end
end
