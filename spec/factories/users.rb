FactoryBot.define do
  factory :user do
    # transient do
    # person { Gimei.name }
    # end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birth_date            { Faker::Date.backward }

    first_name            { '田中'}
    last_name             { '太郎' }
    first_name_kana       { 'タナカ' }
    last_name_kana        { 'タロウ' }
  end
end
