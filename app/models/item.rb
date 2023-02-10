class Item < ApplicationRecord
  belongs_to       :user
  has_one          :purchased_item
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :derivery_charge
  belongs_to_active_hash :sender_area
  belongs_to_active_hash :daystosend

  validates :name,               :string,     presence: true
  validates :explanat,           :text,       presence: true
  validates :price,              :integer,    presence: true, numericality: {greater_than: 300,less_than: 9999999}, format: { with: /\A[0-9]+\z/ }
  validates :category_id,        :integer,    numericality: { other_than: 1 , message: "can't be blank" }
  validates :status_id,          :integer,    numericality: { other_than: 1 , message: "can't be blank" }
  validates :derivery_charge_id, :integer,    numericality: { other_than: 1 , message: "can't be blank" }
  validates :sender_area_id,     :integer,    numericality: { other_than: 1 , message: "can't be blank" }
  validates :daystosend_id,      :integer,    numericality: { other_than: 1 , message: "can't be blank" }
  validates :user,               :references, presence: true, foreign_key: true

end
