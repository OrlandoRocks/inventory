class CreateWorkArticles < ActiveRecord::Migration
  def change
    create_table :work_articles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
