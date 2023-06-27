FactoryBot.define do
  factory :item do
    item_name               {"Example Item"}
    price                  {500}
    item_explain               {"Example item description"}
    category_id  {1}
    item_condition_id      {2}
    delivery_charge_id       {3}
    prefecture_id {4}
    until_sendday_id  {5}
  end
end