module Locale
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end

  private

  def set_locale
    cookies[:locale] = cookies[:locale] || I18n.default_locale
    locale = params.fetch(:locale, cookies[:locale]).to_sym
    if I18n.available_locales.include?(locale)
      I18n.locale = cookies[:locale] = locale
    else
      cookies[:locale] = I18n.default_locale
    end
  end

end
