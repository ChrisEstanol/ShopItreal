class FavoriteProductsController < ApplicationController
  before_action :set_product

  def index
    @favorites = current_user.favorite_products.all
  end

  def create
    if Favorite.create(favorited: @product, user: current_user)
      redirect_to @product, notice: 'product has been added to favorites'
    else
      redirect_to @product, alert: 'Something went wrong...'
    end
  end

  def destroy
    Favorite.where(favorited_id: @product.id, user_id: current_user.id).first.destroy
    redirect_to @product, notice: 'product is no longer in favorites'
  end

  private

  def set_product
    @product = Product.find(params[:product_id] || params[:id])
  end
end
