class AddUsNameToTrailerLengths < ActiveRecord::Migration[5.2]
  def change
    add_column :trailer_lengths, :us_name, :string
  end
end
