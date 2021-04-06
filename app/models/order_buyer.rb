class OrderBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :city, :address, :phone_number, :prefecture_id, :building_name, :token, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンをつけて入力してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'はハイフンなし、 かつ１２桁以上では登録できません' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                    phone_number: phone_number, building_name: building_name, order_id: order.id)
  end
end
