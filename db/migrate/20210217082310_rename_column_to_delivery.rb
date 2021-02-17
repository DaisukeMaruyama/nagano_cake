class RenameColumnToDelivery < ActiveRecord::Migration[5.2]
  def change
    rename_table :deliverlies, :deliveries
  end
end
