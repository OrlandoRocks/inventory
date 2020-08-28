class AddStateToBranch < ActiveRecord::Migration[5.0]
  def change
    add_reference :branches, :state, index: true, foreign_key: true
  end
end
