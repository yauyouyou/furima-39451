class OrderAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user,:item,:card_number,:card_month,:card_year,:security_code,:post_code,:prefecture_id,:municipality,:address,:telephone_number,:building_name


  # orders テーブル
  validates :user, presence: true
  validates :item, presence: true
  validates :card_number, presence: true
  validates :card_month, presence: true
  validates :card_year, presence: true
  validates :security_code, presence: true
  # addresses テーブル
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format of 3 digits, hyphen, and 4 digits' }
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'must be 10 to 11 digits' }
  

  def save
    order = Order.create(user: user, item: item, card_number: card_number, card_month: card_month, card_year: card_year, security_code: security_code)

    address = Address.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      municipality: municipality,
      address: address,
      telephone_number: telephone_number,
      building_name: building_name
    )
    order.persisted? && address.persisted?
  end
end
