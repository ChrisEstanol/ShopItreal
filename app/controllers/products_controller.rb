class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    @product = Product.find(params[:id])
    respond_with(@product)
  end


  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :description)
    end
end
