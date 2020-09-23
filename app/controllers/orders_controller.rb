class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if order.save
      redirect_to root_path
    else
      render :index
  end
end

  private
  def order_params
    params.require(:order_address).permit(:user_id, :item_id,:building_name, :phone_number, :prefecture_id, :postal_code, :city, :house_number )
  end
end
