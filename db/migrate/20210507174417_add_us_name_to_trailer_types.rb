class AddUsNameToTrailerTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :trailer_types, :us_name, :string
  end
end