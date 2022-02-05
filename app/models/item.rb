class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_many   :comments
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_charge, :prefecture,:packaging_day
  
  validates :product_name, :explanation, :price, :image, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :packaging_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end
