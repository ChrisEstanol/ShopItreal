class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
     info = $redis.hgetall current_user_cart
     @cart = Cart.new
     info.each do |product_id, quantity|
       @cart.add_item(CartItem.new(product_id, quantity))
     end

     @cart
  end

  def add
    product_id = params[:product_id].to_i
    quantity = params[:quantity].to_i
    $redis.hset current_user_cart, product_id, quantity

    redirect_to product_path(product_id)
  end

  def remove
    product_id = params[:product_id].to_i
    $redis.hdel current_user_cart, product_id

    redirect_to :back
  end


  private

  def current_user_cart
    "cart#{current_user.id}"
  end
end
