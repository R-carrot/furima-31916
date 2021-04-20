class Order < ApplicationRecord
  belongs_to :buyer

  include ActiveModel::Model
  attr_accessor 
end
