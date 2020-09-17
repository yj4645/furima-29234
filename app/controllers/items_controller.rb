class ItemsController < ApplicationController


  def new
    @item = Item.new
  end

  def edit
    @item = Item.all
  end

  def index
  end

  def create 
    @item = Item.create(item_params)
    redirect_to action: :index
  end

 private

  def item_params
    params.require(:item).permit(:user_id, :name, :price, :explanation, :category_id, :status_id, :burden_id, :prefecture_id, :shipping_days_id, :image).merge(user_id: current_user.id)
  end
end

