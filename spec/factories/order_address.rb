FactoryBot.define do
  factory :order_address do
    token        { 1 }
    postal_code { "111-1111"}
    city        { "名古屋市" }
    house_number { "1" }
    phone_number { "1111111111" }


    prefecture_id  { 4 }
    user_id { 1 }
    item_id { 1 }
   
    
  end
end


