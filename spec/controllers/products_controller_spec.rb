require 'rails_helper'
require_relative '../auth_helper.rb'

RSpec.describe ProductsController, type: :controller do

  describe "Routes" do
    let!(:admin_user){User.create(username: 'tim', email: 'tim@tim.com', password: 'timtim', is_admin: true)}
    let(:product1){Product.create!(name:"prod1", description:"prod1 description", price: 5.78, quantity: 5)}
    let(:product2){Product.create!(name:"prod2", description:"prod2 description", price: 8.78, quantity: 8)}

    describe "GET #index" do

      it "responds successfully with an HTTP 200 status code" do
        get :index, nil, {'id' => admin_user.id}
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the index template" do
        get :index, nil, {'id' => admin_user.id}
        expect(response).to render_template("index")
      end

      it "loads all of the products into @products" do
        get :index , nil, {'id' => admin_user.id}
        expect(assigns(:products)).to be_an(ActiveRecord::Relation)
      end

    end

    describe "GET #show" do
      it "responds successfully with an HTTP 200 status code" do
        get(:show, {:id => product1.id}, {'id' => admin_user.id})
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the show template" do
        get(:show, :id => product1.id)
        expect(response).to render_template("show")
      end

      it "load the product into @product" do
        get( :show, {:id => product2.id}, {'id' => admin_user.id})
        expect(assigns(:product)).to eq(product2)
      end
    end

    describe "GET #edit" do

      it "responds successfully with an HTTP 200 status code" do
        get( :edit, {:id => product1.id}, {'id' => admin_user.id})
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the edit template" do
        get( :edit, {:id => product1.id}, {'id' => admin_user.id})
        expect(response).to render_template("edit")
      end

      it "load the product into @product" do
        get(:edit, {:id => product2.id}, {'id' => admin_user.id})
        expect(assigns(:product)).to eq(product2)
      end
    end

    describe "GET #admin" do

      it "responds successfully with an HTTP 200 status code" do
        get(:admin, nil , {'id' => admin_user.id})
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the admin template" do
        get(:admin, nil , {'id' => admin_user.id})
        expect(response).to render_template("admin")
      end

      it "loads all of the products into @products" do
        get( :admin, nil , {'id' => admin_user.id})
        expect(assigns(:products)).to match_array([product1, product2])
      end
    end

    describe '#create' do

      let!(:test_category) {create :category}
      let(:params) {{"product"=>{
        "img"=>"http://egotvonline.com/wp-content/uploads/2011/01/weird-products-2.jpg",
        "name"=>"prod1",
        "description"=>"prod1 description",
        "price"=>"5.78",
        "quantity"=>"5"}, "category"=>["#{test_category.id}"]}}


      it 'increments products in the database by 1' do
        expect{post(:create, params, {'id' => admin_user.id})}.to change{Product.count}.by(1)
      end

      it 'responds with a status of 302' do
        post(:create, params, {'id' => admin_user.id})
        expect(response.status).to eq(302)
      end
    end

    describe '#update' do
      let!(:test_category) {create :category}
      let(:params) {{"product" => {"name" => "prod1", "description" => ":(", "price" => "5.78", "quantity" => "5"}, "id" => product1.id, "category" => [test_category.id]}}

      context 'on valid params' do

        it 'responds with a status of 302' do
          patch(:update, params,{'id' => admin_user.id})
          expect(response.status).to eq(302)
        end

        it 'updates an product in the database' do
          patch(:update, params,{'id' => admin_user.id})
          expect(product1.reload.description).to eq(":(")
        end

      end
    end

    context 'on invalid params' do
      let(:params) {{"product"=>{"name"=>''}, "id"=>0000}}
      xit 'does not change an product in the database' do
      end
    end

    describe '#destroy' do

      it 'responds with a status of 302' do
        delete(:destroy, {id: product1.id}, {'id' => admin_user.id})
        expect(response.status).to eq(302)
      end

      it 'decrements the products in the database by 1' do
        product2
        expect{delete :destroy, id: product2.id}.to change{Product.count}.by(-1)
      end
    end
  end
end
