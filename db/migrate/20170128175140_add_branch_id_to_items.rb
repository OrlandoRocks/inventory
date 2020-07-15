class AddBranchIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :branch, index: true, foreign_key: true
  end
end
