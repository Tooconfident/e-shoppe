class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  has_many :products, through: :orders

  def total_cost
    self.orders.inject(0) {|sum, order| sum + order.subtotal}
  end
end
