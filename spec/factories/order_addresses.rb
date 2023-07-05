FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '東京都' }
    address { '渋谷区' }
    building_name { 'アジアビル' }
    telephone_number { '0123456789' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
