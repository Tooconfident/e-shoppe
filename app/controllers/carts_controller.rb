class CartsController < ApplicationController
  include PurchaseCart
  def show

  end


  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    @orders = users_cart.orders
    PurchaseCart.deduct_quantities(@orders)
    current_user.send_purchase_email
    users_cart.update(purchased: true)
    current_user.carts.create(purchased: false)
    redirect_to thanks_user_cart_path(current_user, @cart)
  end

  def thanks
    @cart = Cart.find(params[:id])
    @user = User.find(params[:user_id])
  end

end
