class AddPrefectureIdToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :prefecture_id, :integer
  end
end
