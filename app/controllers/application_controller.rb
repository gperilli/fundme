class ApplicationController < ActionController::Base
  before_action :set_locale, :set_sitewide_text
  #before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def set_locale
    if locale_from_header == 'es' || locale_from_header = 'en' || locale_from_header = 'pt'
      if user_signed_in?
        I18n.locale = params[:lang] || current_user.language || locale_from_header || I18n.default_locale 
      else
        I18n.locale = params[:lang] || locale_from_header || I18n.default_locale
      end
    else
      I18n.locale = params[:lang] || 'es'
    end
  end

  def set_sitewide_text
    @sitewide_text_items = SitewideText.all
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
  end

  protected

  #def configure_permitted_parameters
  #  added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
  #  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #  devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
  #  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  #end
end
