class AddUsNameToTrailerWidths < ActiveRecord::Migration[5.2]
  def change
    add_column :trailer_widths, :us_name, :string
  end
end
