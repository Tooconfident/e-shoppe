class CartsController < ApplicationController

  def show

  end

  # def new
  #   @cart = Cart.new
  # end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])

    if @cart.update(cart_params)
      redirect_to @cart
    else
      render 'edit'
    end
  end

end
