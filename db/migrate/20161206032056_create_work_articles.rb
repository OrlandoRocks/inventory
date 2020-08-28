class CreateWorkArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :work_articles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
