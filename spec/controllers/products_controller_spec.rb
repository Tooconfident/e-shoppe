require 'rails_helper'
require_relative '../auth_helper.rb'

RSpec.describe ProductsController, type: :controller do

  describe "Routes" do

    let(:product1){Product.create!(name:"prod1", description:"prod1 description", price: 5.78)}
    let(:product2){Product.create!(name:"prod2", description:"prod2 description", price: 8.78)}

    describe "GET #index" do

      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end

      it "loads all of the products into @products" do
        get :index
        expect(assigns(:products)).to match_array([product1, product2])
      end

    end

    describe "GET #show" do
      it "responds successfully with an HTTP 200 status code" do
        get :show, :id => product1.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the show template" do
        get :show, :id => product1.id
        expect(response).to render_template("show")
      end

      it "load the product into @product" do
        get :show, :id => product2.id
        expect(assigns(:product)).to eq(product2)
      end
    end

    describe "GET #edit" do
      include AuthHelper
      before(:each) do
        http_login
      end

      it "responds successfully with an HTTP 200 status code" do
        get :edit, :id => product1.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the edit template" do
        get :edit, :id => product1.id
        expect(response).to render_template("edit")
      end

      it "load the product into @product" do
        get :edit, :id => product2.id
        expect(assigns(:product)).to eq(product2)
      end
    end

  end
end
