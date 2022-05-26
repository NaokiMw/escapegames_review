class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  private
  def set_search
    @q = Review.ransack(params[:q])
    @search_reviews = @q.result(distinct: true)
  end
  protected
  def configure_permitted_parameters
    added_attrs = [ :email, :username, :profile, :password, :password_confirmation ]
    added_attrs2 = [ :email, :username, :password ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs2
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs2
  end
end
