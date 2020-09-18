class Item < ApplicationRecord

  has_one_attached :image
  belongs_to        :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :burden
  belongs_to_active_hash :shipping_days
  
  

  validates :price, inclusion: { in: 300..9_999_999 }

with_options presence: true do
  validates :name
  validates :price
  validates :explanation
  validates :category_id
  validates :status_id
  validates :prefecture_id
  validates :burden_id
  validates :shipping_days_id
  validates :image
end
end


