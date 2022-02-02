class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_many   :comments
  has_one_attached :image

  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :packaging_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :image, presence: true
end
