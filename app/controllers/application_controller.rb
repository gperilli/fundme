# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale, :set_sitewide_text

  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end

  def set_locale
    I18n.locale = if locale_from_header == 'es' || (locale_from_header = 'en' || (locale_from_header = 'pt'))
                    if user_signed_in?
                      params[:lang] || current_user.language || locale_from_header || I18n.default_locale
                    else
                      params[:lang] || locale_from_header || I18n.default_locale
                    end
                  else
                    params[:lang] || 'es'
                  end
  end

  def set_sitewide_text
    @sitewide_text_items = SitewideText.all
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
  end
end
