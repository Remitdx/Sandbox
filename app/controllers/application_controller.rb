class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  def search
    find_path(params[:query])
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def find_path(query)
    case query
    when "admin"
      redirect_to featureflags_path
    else
      redirect_back_or_to root_path
    end
  end
end
