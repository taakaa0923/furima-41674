class RenamenicknameToname < ActiveRecord::Migration[7.1]
  def change
    rename_column :items, :nickname, :name
  end
end
