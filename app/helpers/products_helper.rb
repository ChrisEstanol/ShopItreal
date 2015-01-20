module ProductsHelper

  def quantity_options(stock)
    array = (1..stock).map do |x|
      [x, x]
    end

    options_for_select(array)
  end
end


