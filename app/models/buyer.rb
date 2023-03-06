class Buyer < ApplicationRecord
  belongs_to :purchased_item

  validates :postal_code,  presence: true
  validates :sender_area_id,  presence: true
  validates :municipality,  presence: true
  validates :house_number,  presence: true
  validate  :building_name
  validates :tell,  presence: true

end