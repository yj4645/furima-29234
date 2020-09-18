FactoryBot.define do
  factory :item do
    name  {Faker::Name.initials(number: 2)}
    price  { 1000 }
    explanation {Faker::Lorem.sentence}
    category_id {'メンズ'}
    status_id   {'新品'}
    burden_id  {'出品者'}
    prefecture_id  {'愛知県'}
    shipping_days_id {'１週間'}
    
    user_id { 1 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample.png'), filename: 'sample.png')
    end
  end
end
