class AddItemIdToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :item_id, :integer, :foreign_key: true
  end
end
