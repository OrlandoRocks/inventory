class AddAcquisitionDateToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :acquisition_date, :date
  end
end
