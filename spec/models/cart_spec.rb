require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:test_user) { create :user }
  let(:cart) {Cart.new(user_id: test_user.id)}

  describe "default values" do
    it "purchase value for current cart should be false" do
      expect(cart.purchased).to be(false)
    end
  end

  describe "associations" do
    it { should belong_to(:user)}
  end
end
