class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def checkout
    session[:return_to] ||= request.referer
    current_user.current_cart.line_items.each do |line_item|
      line_item.item.update(inventory: line_item.item.inventory - line_item.quantity)
    end
    current_user.current_cart.update(status: "submitted")
    current_user.current_cart = nil
    redirect_to session.delete(:return_to), notice: "Your order has been submitted"
  end

end
