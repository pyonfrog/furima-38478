class  PurchasedItem< ApplicationRecord
  attr_accessor :token

  belongs_to :user
  belongs_to :item
  has_one    :buyer

  validates :user_id,  presence: true
  validates :item_id,  presence: true
end
