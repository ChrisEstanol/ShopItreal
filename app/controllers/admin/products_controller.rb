class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @products = current_user.products.all
  end

  def show
    @upload = Upload.new
    @product = Product.find(params[:id])
    respond_with(@product)
  end

  def new
    @product = current_user.products.new
    respond_with(@product)
  end


  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to [:admin, @product], notice: 'Product was successfully created. Now just add some pictures and you are done.'
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to [:admin, @product], notice: 'Product was successfully updated. Do you need to change the pictures.'
    else
      render action: "edit"
    end
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
      params.require(:product).permit(:name, :price, :quantity, :description)
    end
end
