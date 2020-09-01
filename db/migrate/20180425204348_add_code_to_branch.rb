class AddCodeToBranch < ActiveRecord::Migration[5.0]
  def change
    add_column :branches, :code, :string
  end
end
