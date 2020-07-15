class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.text :description
      t.string :contact
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
