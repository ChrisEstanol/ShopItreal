class Cart
  attr_accessor :items

  def initialize
    @items = []
  end

  def add_item(cart_item)
    @items << cart_item
  end

  def subtotal
    sum = 0
    @items.each do |item|
      sum += item.total
    end
    sum
  end
end
