class ChangeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_name, :string, default: false
    remove_column :items, :product_name,:string
  end
end
