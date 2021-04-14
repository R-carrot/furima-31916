class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer

  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :state
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :delivery_fee
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :delivery_date
end
