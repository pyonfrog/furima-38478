class Item < ApplicationRecord
  belongs_to       :user
  has_one          :purchased_item
  has_one_attached :image
end
