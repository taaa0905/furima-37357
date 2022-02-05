class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_many   :comments
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :packaging_day

  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :packaging_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end
