class AddStateToBranch < ActiveRecord::Migration
  def change
    add_reference :branches, :state, index: true, foreign_key: true
  end
end
