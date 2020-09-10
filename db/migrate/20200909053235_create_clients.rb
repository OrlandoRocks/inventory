class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.string :maiden_name
      t.string :address
      t.string :postal_code
      t.string :email
      t.string :phone_number
      t.string :cellphone
      t.string :contact

      t.timestamps
    end
  end
end
