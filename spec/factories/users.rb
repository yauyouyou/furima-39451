FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.email }
    password               { 'yoyo175' }
    password_confirmation  { password }
    firstname_zenkaku      { '太郎' }
    lastname_zenkaku       { '山田' }
    firstname_kana_zenkaku { 'タロウ' }
    lastname_kana_zenkaku  { 'ヤマダ' }
    birthday               { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
