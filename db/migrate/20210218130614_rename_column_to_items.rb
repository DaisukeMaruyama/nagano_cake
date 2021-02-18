class RenameColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :product_name, :item_name
  end
end
