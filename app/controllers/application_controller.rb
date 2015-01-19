class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_search
  protect_from_forgery with: :exception

  layout "admin", if: :devise_controller?, only: :edit

  def set_search
    @search = Product.search(params[:q])
  end

end
