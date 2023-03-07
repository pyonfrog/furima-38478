class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :sender_area_id, :municipality, :house_number, :building_name, :tell, :token
  with_options presence: true do
    # purchased_itemモデルのバリデーション
    validates :user_id
    validates :item_id
    # buyerモデルのバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :sender_area_id, numericality: { other_than: 0 }
    validates :municipality
    validates :house_number
    validates :tell, format: { with: /\A[0-9]{10,11}\z/ }
    #トークンのバリデーション
    validates :token
  end
    validate  :building_name
  def save
    purchased_item = PurchasedItem.create(user_id: user_id, item_id: item_id)
    Buyer.create( purchased_item: purchased_item, postal_code: postal_code, sender_area_id: sender_area_id, municipality: municipality, house_number: house_number, building_name: building_name, tell: tell)
  end
end
