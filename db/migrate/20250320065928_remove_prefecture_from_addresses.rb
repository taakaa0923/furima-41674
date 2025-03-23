class RemovePrefectureFromAddresses < ActiveRecord::Migration[7.1]
  def change
    remove_column :addresses, :prefecture, :string
  end
end
