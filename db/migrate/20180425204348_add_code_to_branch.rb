class AddCodeToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :code, :string
  end
end
