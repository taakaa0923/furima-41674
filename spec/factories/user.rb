FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name       { '漢字' }
    last_name        { '漢字' }
    first_name_kana    { 'カタカナ' }
    last_name_kana     { 'カタカナ' }
    birth_date { Faker::Date.birthday }
  end
end
