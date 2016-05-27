class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  def subtotal
    self.order_qty * self.product.price
  end

  def product_on_order
    current_orders = Order.where(["cart_id = ? and product_id = ?", self.cart_id, self.product_id])
    current_orders.reject!(self)
  end

  def check_available_qty
    self.product.quantity
  end

  def combine_order_total
    qty_to_order =  self.order_qty + self.product_on_order[0].order_qty
  end

  def order_update
      self.order_qty = self.combine_order_total
      if self.save
        self.product_on_order[0].destroy
      end
  end


end
