class AddtextToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :text, :text
  end
end
