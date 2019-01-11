class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_locale

  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters
 
  protected
 
  def configure_permitted_parameters
    added_attrs = [:email, :garare_id, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
