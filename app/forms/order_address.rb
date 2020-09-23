class OrderAddress

  include ActiveModel::ActiveModel
  attr_accessor :user_id, :item_id, :building_name, :phone_number, :prefecture_id, :postal_code, :city, :house_number 

end

def save 
  Order.create(user_id: user_id, item_id: item_id)
  Address.create(building_name: building_name,phone_number: phone_number, orefecture_id: prefecture_id, postal_code: postal_code, city: city, house_number: house_number )
end