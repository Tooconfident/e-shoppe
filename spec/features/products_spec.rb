require 'rails_helper'
require 'support/macros'

RSpec.feature "Products", type: :feature, :js => true do
  let! (:product) { create :product }
  let!(:category) {Category.create(name: "Shoes")}
  let!(:admin_user){User.create(username: 'tim', email: 'tim@tim.com', password: 'timtim', is_admin: true)}
  before(:each) do
    @tim = User.create!(username: 'tim', email: 'tim@tim.com', password: 'timtim', is_admin: true)
    page.set_rack_session(id: @tim.id)
  end
  describe "#index" do
    it "display the welcome page" do
      visit root_path
      expect(page).to have_content("Welcome to the E-shoppe")
    end
  end

  describe "logging in" do
    it "users can log in" do
      visit login_path
      fill_in "Username", :with => admin_user.username
      fill_in "Password", :with => admin_user.password
      click_button "Login"
      expect(page).to have_content("All Available Products")
    end

  end

  describe "products#index" do
    it "should have products displayed" do
      visit products_path
      expect(page).to have_content(product.name)
    end
  end

  describe "products#show" do
    it "should display a product" do
      visit product_path(product)
      expect(page).to have_content(product.price)
    end
  end

  describe "products#new" do
    it "should display the new product form" do
      visit new_product_path
      expect(page).to have_content("New Product Form")
    end

    it 'submit a new product' do
      visit new_product_path
      fill_in "Name", with: "Cup"
      fill_in "Description", with: "A regular mug"
      fill_in "Price", with: 14.99
      fill_in "Quantity", with: 2
      page.check "category[]"
      click_button "Create Product"
      expect(page).to have_content("Cup")
    end
  end

  # describe "products#new" do
  #   it "should display the new product form" do
  #     visit new_product_path
  #     expect(page).to have_content("New Product Form")
  #   end
  # end
end

