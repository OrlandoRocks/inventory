class AddCodeSequenceToDepartment < ActiveRecord::Migration[5.0]
  def change
    add_column :departments, :code, :string
    add_column :departments, :sequence, :int
  end
end
