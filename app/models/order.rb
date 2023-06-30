class Order < ApplicationRecord
  has_one   :address
  belong_to :item
end
