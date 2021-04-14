class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_fee
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_date

  with_options presence:true do
    validates :title
    validates :explain
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_date_id
  end
  
end
