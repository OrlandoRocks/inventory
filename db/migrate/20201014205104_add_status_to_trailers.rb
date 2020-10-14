class AddStatusToTrailers < ActiveRecord::Migration[5.2]
  def change
    add_column :trailers, :status, :boolean
    add_reference :trailers, :trailer_type, foreign_key: true
  end
end
