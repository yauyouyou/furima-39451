FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '東京都' }
    address { '渋谷区' }
    telephone_number { '0123456789' }
  end
end
