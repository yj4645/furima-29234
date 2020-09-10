class ItemsController < ApplicationController
  def items_params
    params.require(:item).permit(:user, :name, :price)
  end

  

  def index
    @user = User.new
  end
 


  


end
