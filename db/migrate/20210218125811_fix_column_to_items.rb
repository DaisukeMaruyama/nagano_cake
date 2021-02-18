class FixColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_name, :string
    remove_column :items, :item_name,:string, default: "f"
  end
end
