class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache) }
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def other_locales
    ["pl", "en"] - [ I18n.locale.to_s ]
  end
  helper_method :other_locales

  before_action :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
