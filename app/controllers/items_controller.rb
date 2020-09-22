class ItemsController < ApplicationController
before_action :set_item, only: [:edit, :show, :update]

  def new
    @item = Item.new
  end

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def destroy
    if item = Item.find(params[:id])
       item.destroy
       redirect_to root_path
    else
      render :show
  end
end

  def create 
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
  end
end


  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
  end
end


 private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :status_id, :burden_id, :prefecture_id, :shipping_days_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

