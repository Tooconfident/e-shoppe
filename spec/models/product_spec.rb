require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product_no_name) { Product.new(description: "I have no name", price: 3.75)}
  let(:product_no_description) { Product.new(name: "No description", price: 3.75)}
  let(:product_no_price) { Product.new(description: "Buy me", name: "I'm free")}
  it "can add a product" do
    chair = Product.create!(name: "chair", description: "You can sit on it", img: "http://mediatechnologies.com/images/sized/uploads/products/pr_post_chair-0x640.png", price: 45.99)
    xylaphone = Product.create!(name: "xylaphone", description: "You can sit on it", img: "http://mediatechnologies.com/images/sized/uploads/products/pr_post_chair-0x640.png", price: 45.99)
    expect(Product.all.order(:name)).to eq([chair, xylaphone])
  end

  describe "vailidations" do
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
      it "when the price has more than 2 decimals" do
        product_no_price.save
        expect(product_no_price.errors[:price]).to include("is invalid")
      end
    end
  end
end
