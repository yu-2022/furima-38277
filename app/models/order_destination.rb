class OrderDestination
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :prefecture_id, :city, :block, :building, :tel, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :block
    validates :tel, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Destination.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building,
                       tel: tel, order_id: order.id)
  end
end
