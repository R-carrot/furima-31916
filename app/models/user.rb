class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyers

  validates :nickname,             presence: true
  validates :first_name,           presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :first_name_katakana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_katakana,   presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day,            presence: true

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :encrypted_password, format: { with: VALID_PASSWORD_REGEX }
end
