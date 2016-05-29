class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  def subtotal
    self.order_qty * self.product.price
  end

end
