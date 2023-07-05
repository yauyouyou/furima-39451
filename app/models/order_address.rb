class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :telephone_number, :building_name, :token

    # orders テーブル
  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id

    # addresses テーブル
    validates :post_code,
              format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format of 3 digits, hyphen, and 4 digits' }
              validates :prefecture_id, exclusion: { in: [2], message: 'is reserved' }
    validates :municipality, :address
    validates :telephone_number,
              format: { with: /\A[0-9]{10,11}\z/, message: 'must be 10 to 11 digits and contain only numbers' }
  end

  def save
    order = Order.create(user_id:, item_id:)

    Address.create(
      post_code:,
      prefecture_id:,
      municipality:,
      address:,
      telephone_number:,
      building_name:,
      order_id: order.id
    )
  end
end
