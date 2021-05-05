class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_item, only: [:show, :destroy, :edit]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    if @item.user == current_user && @item.buyer.blank?
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title,:explain,:category_id,:delivery_fee_id,:prefecture_id,:delivery_date_id,:state_id,:price,:image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
