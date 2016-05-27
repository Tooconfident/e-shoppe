module OrderUpdater
  def self.create_or_update(product_id, cart_id, qty)
    order = Order.find_or_create_by(
      product_id: product_id,
      cart_id: cart_id
    )
    if order.order_qty.nil?
      order.update(order_qty: qty)
    elsif order.order_qty + qty < order.product.quantity
      order.update(order_qty: qty + order.order_qty)
    else
      order.errors[:order_qty] << "Quantity exceeds current supply"
    end
    order
  end
end
