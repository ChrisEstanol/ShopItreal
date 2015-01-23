class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_search
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  layout "admin", if: :devise_controller?, only: :edit

  def set_search
    @search = Product.search(params[:q])
  end

  protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name
     devise_parameter_sanitizer.for(:account_update) << :name
     devise_parameter_sanitizer.for(:account_update) << :username
     devise_parameter_sanitizer.for(:account_update) << :surname
   end



end
