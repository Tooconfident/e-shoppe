class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # http_basic_authenticate_with name: "admin", password: "secret", only: [:admin, :destroy, :edit, :create]

  def index
    if !logged_in_user
      redirect_to root_path
    end
    @products = Product.all
  end

  def show
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def edit
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    params.require(:category).each do |id|
      @product.category_products.create(category_id: id)
    end
    if @product.save
      flash[:success] = "Product Added!"
      redirect_to @product
    else
      flash[:danger] = "Product has errors!"
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      @product.category_products.all.each {|cat| cat.destroy}
      params.require(:category).each do |id|
        @product.category_products.create(category_id: id)
      end
      flash[:success] = "Product updated!"
      redirect_to @product
    else
      flash[:danger] = "Product unable to be updated!"
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def admin
    if current_user.is_admin
      @products = Product.all
    else
      redirect_to products_path
    end
  end

  private
    def product_params
      params.require(:product).permit(:img, :name, :description, :price, :quantity)
    end

    def set_product
      @product = Product.find(params[:id])
    end


end
