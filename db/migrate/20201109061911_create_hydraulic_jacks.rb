class CreateHydraulicJacks < ActiveRecord::Migration[5.2]
  def change
    create_table :hydraulic_jacks do |t|
      t.string :name
      t.string :model_part
      t.boolean :status

      t.timestamps
    end
  end
end
