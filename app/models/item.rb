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
    validates :title
    validates :explain
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { :greater_than => 299, :less_than => 10000000 }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_date_id
  end
  
end
