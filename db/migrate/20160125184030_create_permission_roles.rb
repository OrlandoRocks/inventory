class CreatePermissionRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :permission_roles do |t|
      t.references :role, index: true, foreign_key: true
      t.references :permission, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
