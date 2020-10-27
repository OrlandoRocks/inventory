class AddModelToTrailerTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :trailer_types, :model_part, :string
  end
end
