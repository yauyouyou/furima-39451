class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :telephone_number, :building_name, :token

  # orders テーブル
  validates :token, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true

  # addresses テーブル
  validates :post_code, presence: true,
                        format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format of 3 digits, hyphen, and 4 digits' }
  validates :prefecture_id, presence: { message: 'Prefecture is reserved' }, exclusion: { in: [2] }
  validates :municipality, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A[0-9]{10,11}\z/, message: 'must be 10 to 11 digits and contain only numbers' }

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
