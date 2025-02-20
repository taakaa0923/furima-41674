class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shipping_fee_status

  validates :image, presence: true
  validates :name, presence: true
  validates :category_id, presence: true
  validates :sales_status_id, presence: true
  validates :shipping_fee_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_delivery_id, presence: true
  validates :price, presence: true
  validates :user, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :price, numericality: { less_than: 9_999_999, greater_than: 300 }

  belongs_to :user
  has_one_attached :image
end
