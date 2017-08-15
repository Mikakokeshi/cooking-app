class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:email, :username, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache]
    devise_parameter_sanitizer.permit :sign_in, keys: [:email, :password, :remember_me]
    devise_parameter_sanitizer.permit :account_update, keys: [:email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar]
  end
end

