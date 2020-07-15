class AddCompanyToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :company, index: true, foreign_key: true
  end
end
