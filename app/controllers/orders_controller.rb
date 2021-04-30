class OrdersController < ApplicationController
  def index
    @order = BuyerOrder.new
    # set_item
  end

  def create
    @order = BuyerOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def order_params
    params.require(:buyer_order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end