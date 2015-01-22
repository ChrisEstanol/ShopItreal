class PagesController < ApplicationController
  def home
    @selection = Product.order("created_at DESC").limit(8)
  end


end
