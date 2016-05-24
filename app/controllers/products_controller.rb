class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "admin", password: "secret", only: [:admin, :destroy, :edit, :create]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
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
    @products = Product.all
  end

  private
    def product_params
      params.require(:product).permit(:img, :name, :description, :price, :quantity)
    end

    def set_product
      @product = Product.find(params[:id])
    end

end
