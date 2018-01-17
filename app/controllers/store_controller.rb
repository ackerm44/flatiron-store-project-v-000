class StoreController < ApplicationController
  before_action :current_user

  def index
    @user = current_user
    @cart = @user.current_cart if @user
    @categories = Category.all
    @items = Item.available_items
  end

end
