FactoryBot.define do
  factory :item do
    item_name { 'Example Item' }
    price { 500 }
    item_explain { 'Example item description' }
    category_id { 2 }
    item_condition_id { 3 }
    delivery_charge_id { 4 }
    prefecture_id { 5 }
    until_sendday_id { 6 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/support/test_image.jpg'), filename: 'image/jpg')
    end
  end
end
