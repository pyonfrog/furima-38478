class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :firstname,           presence: true
  validates :lastname,            presence: true
  validates :pronounce_firstname, presence: true
  validates :pronounce_lastname,  presence: true
  validates :nickname,            presence: true
  validates :birthday,            presence: true
end