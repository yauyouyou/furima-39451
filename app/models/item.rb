class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one    :order

  validates :item_name, presence: true
  validates :price, presence: true,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  validates :item_explain, presence: true
  validates :category_id, presence: true, exclusion: { in: [1] }
  validates :item_condition_id, presence: true, exclusion: { in: [1] }
  validates :delivery_charge_id, presence: true, exclusion: { in: [1] }
  validates :prefecture_id, presence: true, exclusion: { in: [1] }
  validates :until_sendday_id, presence: true, exclusion: { in: [1] }


  validate :validate_image_presence
  validate :validate_price_format

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :condition
  belongs_to :region
  belongs_to :sendday

  def sold_out?
    order.present?
  end

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
