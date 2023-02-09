class Item < ApplicationRecord
  belongs_to       :user
  has_one          :purchased_item
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :derivery_charge
  belongs_to :sender_area
  belongs_to :daystosend

end
