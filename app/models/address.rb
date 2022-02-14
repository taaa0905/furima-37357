class Address < ApplicationRecord
  belongs_to :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # validates :post_code, :city, :block, :tel_number, presence: true
  # validates :prefecture, numericality: { other_than: 1 , message: "can't be blank" }
end
