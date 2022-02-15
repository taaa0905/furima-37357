class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :tel_number, :token

  with_options presence: true do
    validates :city, :block, :user_id, :item_id, :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :tel_number, format: { with: /\A([0-9]{10,11})\z/, message: 'is ten or eleven figures' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building,
                   tel_number: tel_number, purchase_id: purchase.id)
  end
end
