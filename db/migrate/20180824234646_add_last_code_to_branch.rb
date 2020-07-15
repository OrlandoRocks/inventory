class AddLastCodeToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :last_code, :int
  end
end
