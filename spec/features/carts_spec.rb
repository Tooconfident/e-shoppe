RSpec.feature "Carts", type: :feature, js: true do
  let! (:product) { create :product }
  let!(:category) {Category.create(name: "Shoes")}
  let!(:admin_user){User.create(username: 'tim', email: 'tim@tim.com', password: 'timtim', is_admin: true)}
  before(:each) do
    @tim = User.create!(username: 'tim', email: 'tim@tim.com', password: 'timtim', is_admin: true)
    page.set_rack_session(id: @tim.id)
    @cart = @tim.carts.create(purchased: false)
    @cart.orders.create(product_id: product.id, order_qty: 2)
  end

  describe "edit link" do
    it "opens a form to modify quantity" do
      visit user_cart_path(@tim, @cart)
      click_link "Edit"
      expect(page).to have_content("Edit Order")
    end

    it "change the quantity when a new value is given" do
      visit user_cart_path(@tim, @cart)
      click_link "Edit"
      fill_in "Order Quantity", with: 3
      click_button "Update Order"
      expect(page).to have_content(3)
    end
  end

  describe "remove link" do
    it "should remove the product row from the cart" do
      visit user_cart_path(@tim, @cart)
      click_link "Remove"
      expect(page).to_not have_content(2)
    end

    it "disables the purchase button when there are no items" do
      visit user_cart_path(@tim, @cart)
      click_link "Remove"
      find(:button, "Purchase", disabled: true)
    end
  end
end
