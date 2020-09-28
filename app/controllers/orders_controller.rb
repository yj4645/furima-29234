class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!


  def index
    @order = OrderAddress.new(order_params)
    if current_user.id == @item.user_id || @item.order !=nil
      redirect_to root_path
    end
  end


  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
  end
end

  private
  
  def order_params
    params.permit(:item_id,:building_name, :phone_number, :prefecture_id, :postal_code, :city, :house_number, :price, :token ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],   
      currency:'jpy' 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


end
