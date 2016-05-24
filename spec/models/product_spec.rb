require 'rails_helper'

RSpec.describe Product, type: :model do
  it "can add a product" do
    chair = Product.create!(name: "chair", description: "You can sit on it", img: "http://mediatechnologies.com/images/sized/uploads/products/pr_post_chair-0x640.png", price: 45.99)
    xylaphone = Product.create!(name: "xylaphone", description: "You can sit on it", img: "http://mediatechnologies.com/images/sized/uploads/products/pr_post_chair-0x640.png", price: 45.99)
    expect(Product.all.order(:name)).to eq([chair, xylaphone])
  end
end
