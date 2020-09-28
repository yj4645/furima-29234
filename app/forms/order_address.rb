class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :building_name, :phone_number, :prefecture_id, :postal_code, :city, :house_number, :token
  
  with_options presence: true do
  validates :token
  validates :postal_code
  validates :city
  validates :house_number
  validates :phone_number
  validates :prefecture_id, numericality: { other_than: 1 }
  end

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフンを使用してください' } do
  end

  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'ハイフンは使用しないでください' } do
  end


def save 
  Order.create(user_id: user_id, item_id: item_id)
  Address.create(building_name: building_name,phone_number: phone_number, prefecture_id: prefecture_id, postal_code: postal_code, city: city, house_number: house_number )
end
end