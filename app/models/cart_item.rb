class CartItem
  attr_accessor :product_id, :quantity

  def initialize(product_id, quantity)
    @product_id = product_id
    @quantity = quantity
  end

  def product
    Product.find(product_id)
  end

  def total
    product.price * quantity.to_i
  end
end
