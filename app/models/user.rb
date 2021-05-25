class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyers

  with_options presence: true do
    validates :nickname
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true} do
      validates :first_name
      validates :last_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/, allow_blank: true} do
      validates :first_name_katakana
      validates :last_name_katakana
    end
    validates :birth_day
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, allow_blank: true}
  # validates :encrypted_password, format: { with: VALID_PASSWORD_REGEX }
end