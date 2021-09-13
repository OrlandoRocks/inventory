class AddYearModelToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :year_model, :string
  end
end
