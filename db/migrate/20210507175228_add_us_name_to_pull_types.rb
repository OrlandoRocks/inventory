class AddUsNameToPullTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :pull_types, :us_name, :string
  end
end
