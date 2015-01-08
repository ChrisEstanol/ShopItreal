class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = current_user.products.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = current_user.products.new(product_params)
    @product.save
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def correct_user
      @product = current_user.products.find_by(id: params[:id])
      redirect_to products_path, notice: "Not authorized to edit this product" if @product.nil?
    end

    def product_params
      params.require(:product).permit(:name, :price, :description)
    end
end
