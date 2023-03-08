class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :sender_area_id, :municipality, :house_number, :building_name, :tell, :token
    
    # purchased_itemモデルのバリデーション
    validates :user_id, presence: true
    validates :item_id, presence: true
    # buyerモデルのバリデーション
    validates :postal_code,    presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :sender_area_id, presence: true, numericality: { other_than: 1 }
    validates :municipality,   presence: true
    validates :house_number,   presence: true
    validate  :building_name
    validates :tell,           presence: true, format: { with: /\A[0-9]{10,11}\z/ }
    #トークンのバリデーション
    validates :token, presence: true

  def save
    purchased_item = PurchasedItem.create(user_id: user_id, item_id: item_id)
    Buyer.create( purchased_item: purchased_item, postal_code: postal_code, sender_area_id: sender_area_id, municipality: municipality, house_number: house_number, building_name: building_name, tell: tell)
  end
end

