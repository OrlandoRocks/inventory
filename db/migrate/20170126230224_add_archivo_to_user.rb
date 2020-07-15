class AddArchivoToUser < ActiveRecord::Migration
  def change
    add_column :users, :received_file, :string
  end
end
