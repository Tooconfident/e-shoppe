require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:product) { create :product}

  describe "associations" do
    it { should belong_to(:cart)}
    it { should belong_to(:product)}
  end

  describe "subtotal method" do
    it "should calculate the subtotal for an order" do
      product.update(price: 5)
      order = Order.create(product_id: product.id, order_qty: 2)
      expect(order.subtotal).to eq(10)
    end
  end
end
