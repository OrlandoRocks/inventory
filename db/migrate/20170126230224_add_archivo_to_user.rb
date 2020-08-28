class AddArchivoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :received_file, :string
  end
end
