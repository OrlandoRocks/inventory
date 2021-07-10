class AddUsNameToColors < ActiveRecord::Migration[5.2]
  def change
    add_column :colors, :us_name, :string
  end
end
