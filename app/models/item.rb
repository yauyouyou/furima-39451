class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :item_name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :item_explain, presence: true
  validates :category_id, presence: { message: 'must be selected' }, exclusion: { in: [1] }
  validates :item_condition_id, presence: { message: 'must be selected' }, exclusion: { in: [1] }
  validates :delivery_charge_id, presence: { message: 'must be selected' }, exclusion: { in: [1] }
  validates :prefecture_id, presence: { message: 'must be selected' }, exclusion: { in: [1] }
  validates :until_sendday_id, presence: { message: 'must be selected' }, exclusion: { in: [1] }

  validate :validate_image_presence
  validate :validate_price_format

  belongs_to :category, class_name: 'Category', foreign_key: 'category_id', optional: true
  belongs_to :item_condition, class_name: 'Condition', foreign_key: 'item_condition_id', optional: true
  belongs_to :delivery_charge, class_name: 'Charge', foreign_key: 'delivery_charge_id', optional: true
  belongs_to :prefecture, class_name: 'Region', foreign_key: 'prefecture_id', optional: true
  belongs_to :until_sendday, class_name: 'Sendday', foreign_key: 'until_sendday_id', optional: true

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