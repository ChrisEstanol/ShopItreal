class PagesController < ApplicationController
  # before_action :authenticated

  def home
    @selection = Product.order("created_at DESC").limit(8)
  end

  # def authenticated
  #   redirect_to :products if signed_in?
  # end
end
