class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  validates :firstname,           presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :lastname,            presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :pronounce_firstname, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :pronounce_lastname,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nickname,            presence: true
  validates :birthday,            presence: true
end