FactoryBot.define do
  factory :item do
    item_name { 'Example Item' }
    price { 500 }
    item_explain { 'Example item description' }
    category_id { 1 }
    item_condition_id { 3}
    delivery_charge_id { 4 }
    prefecture_id { 5 }
    until_sendday_id { 6 }


    association :user

    after(:build) do |item|
      file = File.open(Rails.root.join('spec', 'support', 'test_image.jpg'))
      item.image.attach(io: file, filename: 'test_image.jpg', content_type: 'image/jpg')
      file.close
    end
  end
end
