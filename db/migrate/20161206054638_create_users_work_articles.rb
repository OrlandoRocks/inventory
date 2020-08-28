class CreateUsersWorkArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :users_work_articles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :work_article, index: true, foreign_key: true
      t.integer :reception_status
      t.integer :delivery_status

      t.timestamps null: false
    end
  end
end
