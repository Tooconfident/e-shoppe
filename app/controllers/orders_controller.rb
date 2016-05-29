class OrdersController < ApplicationController
  include OrderUpdater

  def new
    @product = Product.find(params[:prod_id])

    @order = Order.new
    respond_to do |format|
      format.html {render "new", layout: false}
    end
  end

  def create
    order = OrderUpdater.create_or_update(
      params[:prod_id],
      users_cart.id,
      params[:order][:order_qty]
    )

    if order.errors.include?(:order_qty)
      flash[:danger] = order.errors[:order_qty][0]
      order.destroy
    else
      flash[:success] = "Product Added to your Cart!"
    end

    redirect_to order.product
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    new_price = users_cart.total_cost
    last_item = users_cart.orders.empty?
    p last_item
    info_hash = {new_price: new_price, last_item: last_item}
    respond_to do |format|
      format.json { render json: info_hash }
      format.html { render "carts/show" }
    end

  end

  def update
    order = OrderUpdater.edit_quantity(
      params[:prod_id],
      users_cart.id,
      params[:order][:order_qty]
    )

    if order.errors.include?(:order_qty)
      flash.now[:danger] = order.errors[:order_qty][0]
    else
      flash.now[:success] = "Product Added to your Cart!"
    end
    total = order.subtotal
    quantity = order.order_qty
    grand_total = users_cart.total_cost
    info_hash = {total: total, quantity: quantity, grand_total: grand_total}
    respond_to do |format|
      format.json { render json: info_hash }
      format.html { render "carts/show" }
    end

  end

  def edit
    @order = Order.find(params[:id])
    @product = Product.find(@order.product.id)

    respond_to do |format|
      format.html {render "edit", layout: false}
    end
  end

end
