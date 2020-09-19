class ItemsController < ApplicationController


  def new
    @item = Item.new
  end

  #def edit
   # @item = Item.all
  #end

  def index
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
  end
end

 private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :status_id, :burden_id, :prefecture_id, :shipping_days_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

