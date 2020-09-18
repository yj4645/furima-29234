FactoryBot.define do
  factory :item do
    name  {Faker::Name.initials(number: 2)}
    price  { 1000 }
    explanation {Faker::Lorem.sentence}
    category_id { 4 }
    status_id   { 3 }
    burden_id  { 3 }
    prefecture_id  { 4 }
    shipping_days_id { 5 }
    
    user_id { 1 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample.png'), filename: 'sample.png')
    end
  end
end
