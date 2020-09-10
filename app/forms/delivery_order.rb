class DeliveryOrder

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/ }, length: { is: 8 }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :block
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end
