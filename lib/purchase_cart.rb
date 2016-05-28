module PurchaseCart
  def self.deduct_quantities(orders)
    orders.each do |order|
      order.product.update(quantity: order.product.quantity - order.order_qty)
    end
  end
end
