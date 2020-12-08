class AddBrandToTrailers < ActiveRecord::Migration[5.2]
  def change
    add_reference :trailers, :brand, foreign_key: true
  end
end
