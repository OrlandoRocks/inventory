class AddCompanyToCategory < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :company, index: true, foreign_key: true
  end
end
