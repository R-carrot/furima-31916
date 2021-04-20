class OrdersController < ApplicationController
  def index
    # @order = Order.new(order_params)
  end


  # private

  # def order_params
  #   params.permit(:postail_code, :pregecture_id, :city, :address, :building, :phone_number).merge(buyers: current_user.id)
  # end
end
