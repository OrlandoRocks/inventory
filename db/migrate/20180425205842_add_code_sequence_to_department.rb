class AddCodeSequenceToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :code, :string
    add_column :departments, :sequence, :int
  end
end
