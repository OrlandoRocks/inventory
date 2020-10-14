class CreateTrailerTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :trailer_types do |t|
      t.string :name
      t.string :image
      t.boolean :status

      t.timestamps
    end
  end
end
