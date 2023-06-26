class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  validates :item_name, presence: true
  validates :price, presence: true
  validates :item_explain, presence: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :until_sendday_id, presence: true
  validate :validate_image_presence

  private

  def validate_image_presence
    return if image.attached?

    errors.add(:image, 'must be attached')
  end
end


:item_name, :price, :item_explain, :category_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :until_sendday_id).merge(user_id: current_user.id)