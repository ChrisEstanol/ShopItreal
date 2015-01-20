class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @search = Product.search(params[:q])
    @products = @search.result(distinct: true)
  end

  def show
    @search = Product.search(params[:q])
    @product = Product.find(params[:id])
    @cart_action = @product.cart_action current_user.try :id
    respond_with(@product)
  end


  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :quantity, :description)
    end
end
