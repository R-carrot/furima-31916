class Buyer < ApplicationRecord
  belongs_to :item
  has_one    :delivery_info
  belongs_to :user
end
