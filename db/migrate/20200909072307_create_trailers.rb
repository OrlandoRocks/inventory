class CreateTrailers < ActiveRecord::Migration[5.2]
  def change
    create_table :trailers do |t|
      t.string :name
      t.string :model
      t.string :photo

      t.timestamps
    end
  end
end
