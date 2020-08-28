class AddBranchIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :branch, index: true, foreign_key: true
  end
end
