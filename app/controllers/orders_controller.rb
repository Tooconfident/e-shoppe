class OrdersController < ApplicationController

  def new
    @product = Product.find(params[:prod_id])
    @order = Order.new
  end

  def create
    order = OrderUpdater.create_or_update(
      params[:prod_id],
      users_cart.id,
      params[:order][:order_qty]
    )

    if order.errors.include?(:order_qty)
      flash[:danger] = "Quantity exceeds current supply"
    else
      flash[:success] = "Product Added to your Cart!"
    end

    redirect_to order.product
  end

  def destroy

  end

  def update

  end

  def edit

  end

end
