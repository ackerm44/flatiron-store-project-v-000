class LineItemsController < ApplicationController
  
  def create
    @user = current_user
    if @user.nil?
      redirect_to new_user_session_path
    else
      @user.create_current_cart unless @user.current_cart
      current_user.current_cart.add_item(params[:item_id]).save
      redirect_to cart_path(current_user.current_cart)
    end
  end

end
