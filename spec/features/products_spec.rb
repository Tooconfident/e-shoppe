require 'rails_helper'

RSpec.feature "Products", type: :feature, :js => true do
  describe "#index" do
    let! (:product) { create :product }
    it "should return the list of products" do
      visit root_path
      expect(page).to have_content(product.name)
    end
  end
end
