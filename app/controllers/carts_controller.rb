class CartsController < ApplicationController
  include PurchaseCart
  def show

  end


  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @orders = users_cart.orders
    PurchaseCart.deduct_quantities(@orders)
    current_user.send_purchase_email
    users_cart.update(purchased: true)
    current_user.carts.create(purchased: false)
    redirect_to products_path
  end

end
