class AddLastDigitsToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :last_digits, :string
  end
end
