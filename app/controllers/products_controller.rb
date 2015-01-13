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
    @product = Product.find(params[:id])
    @uploads = @product.uploads
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

    respond_to do |format|
      if @product.save

        if params[:images]
          params[:images].each { |image|
            @product.uploads.create(image: image)
          }
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(product_params)
        if params[:images]
          params[:images].each { |image|
            @product.uploads.create(image: image)
          }
        end
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
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
      params.require(:product).permit(:name, :price, :description, :uploads)
    end
end
