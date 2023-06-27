class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :item_name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :item_explain, presence: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :until_sendday_id, presence: true
  
  validate :validate_image_presence
  validate :validate_price_format

  private

  def validate_image_presence
    return if image.attached?

    errors.add(:image, 'must be attached')
  end

  def validate_price_format
    return if price.blank? || price.to_s.match?(/\A[0-9]+\z/)

    errors.add(:price, 'is not a number')
  end
end
