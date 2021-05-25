class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :prefecture
  belongs_to :delivery_fee
  belongs_to :delivery_date

  with_options presence: true do
    validates :image, presence: {message: "を選択してください"}
    validates :title
    validates :explain
  end

  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_date_id
  end
  
  validates :price_custom_error
  # validates :price, presence: true, format: { with: /\A[0-9]+\z/, allow_blank: true, message: "は数値で入力してください"}
  # validates :price, numericality: { greater_than: 299, less_than: 10000000, message: "は300円以上、10,000,000円未満に設定してください", allow_blank: true}

  def price_custom_error
    if price.blank?
      errors[:base] = "価格を入力してください"
    elsif price.match(/\A[0-9]+\z/) == nil
      errors[:base] = "価格は数値で入力してください"
    elsif price < 300
      errors[:base] = "価格は300円以上で設定してください"
    elsif price >= 10000000
      errors[:base] = "価格は10,000,000円以下で設定してください"
    end
  end
end
