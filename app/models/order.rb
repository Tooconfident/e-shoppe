class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  def subtotal
    self.order_qty * self.product.price
  end

  def check_available_qty
    self.product.quantity
  end

end
