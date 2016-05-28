module OrderUpdater
  def self.create_or_update(product_id, cart_id, qty)
    order = Order.find_or_create_by(
      product_id: product_id,
      cart_id: cart_id
    )
    if qty.to_i <= order.product.quantity && qty.to_i > 0
      if order.order_qty.nil?
        order.update(order_qty: qty)
      elsif order.order_qty + qty.to_i <= order.product.quantity
        order.update(order_qty: qty.to_i + order.order_qty)
      else
        order.errors[:order_qty] << "Quantity Incorrect"
      end
    else
      order.errors[:order_qty] << "Quantity Incorrect"
    end
    order
  end

  def self.edit_quantity(product_id, cart_id, qty)
    order = Order.find_or_create_by(
      product_id: product_id,
      cart_id: cart_id
    )

    if order.order_qty < order.product.quantity && qty.to_i > 0
      order.update(order_qty: qty.to_i)
    else
      order.errors[:order_qty] << "Quantity Incorrect"
    end

    order
  end

  # private

  # def find_order(product_id, cart_id)
  #   Order.find_or_create_by(
  #     product_id: product_id,
  #     cart_id: cart_id
  #   )
  # end

end
