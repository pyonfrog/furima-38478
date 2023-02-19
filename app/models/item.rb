class Item < ApplicationRecord
  belongs_to       :user
  # 購入機能で記述
  # has_one          :purchased_item
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :derivery_charge
  belongs_to_active_hash :sender_area
  belongs_to_active_hash :daystosend

  validates :image,              presence: true
  validates :name,               presence: true
  validates :explanat,           presence: true
  validates :price,              presence: true, numericality: {only_integer: true, greater_than: 300,less_than: 9999999}
  validates :category_id,        numericality: { other_than: 1 , message: "can't be blank" }
  validates :status_id,          numericality: { other_than: 1 , message: "can't be blank" }
  validates :derivery_charge_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :sender_area_id,     numericality: { other_than: 1 , message: "can't be blank" }
  validates :daystosend_id,      numericality: { other_than: 1 , message: "can't be blank" }

end