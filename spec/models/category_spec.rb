require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category_no_name) { Category.new}

  let(:category) { create :category}
  it "can add a Category" do
    category
    expect(Category.count).to eq(1)
  end

  describe "associations" do
    it { should have_many(:products)}
  end

  describe "validations" do
    context "will raise an error" do
      it "when the name field is empty" do
        category_no_name.save
        expect(category_no_name.errors[:name]).to include("can't be blank")
      end
    end
  end
end
