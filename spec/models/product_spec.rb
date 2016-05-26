require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product_no_name) { Product.new(description: "I have no name", price: 3.75, quantity: 2)}
  let(:product_no_description) { Product.new(name: "No description", price: 3.75, quantity: 2)}
  let(:product_no_price) { Product.new(description: "Buy me", name: "I'm free", quantity: 2)}
  let(:product_wrong_decimal) { Product.new(description: "Buy me", name: "I'm free", price: 4.234, quantity: 2)}
  let(:product_no_quantity) {Product.new(description: "Buy me", name: "I'm free", price: 12.99)}

  it "can add a product" do
    chair = Product.create!(name: "chair", description: "You can sit on it", img: "http://mediatechnologies.com/images/sized/uploads/products/pr_post_chair-0x640.png", price: 45.99, quantity: 45)
    xylaphone = Product.create!(name: "xylaphone", description: "You can sit on it", img: "http://mediatechnologies.com/images/sized/uploads/products/pr_post_chair-0x640.png", price: 45.99, quantity: 2)
    expect(Product.all.order(:name)).to eq([chair, xylaphone])
  end

  describe "associations" do
    it { should have_many(:categories)}
  end

  describe "validations" do
    context "will raise an error" do
      it "when the name field is empty" do
        product_no_name.save
        expect(product_no_name.errors[:name]).to include("can't be blank")
      end
      it "when the description field is empty" do
        product_no_description.save
        expect(product_no_description.errors[:description]).to include("can't be blank")
      end
      it "when the price field is empty" do
        product_no_price.save
        expect(product_no_price.errors[:price]).to include("can't be blank")
      end
      it "when the quantity field is empty" do
        product_no_quantity.save
        expect(product_no_quantity.errors[:quantity]).to include("can't be blank")
      end
      it "when the price has more than 2 decimals" do
        product_wrong_decimal.save
        expect(product_wrong_decimal.errors[:price]).to include("is invalid")
      end
    end
  end
end
