class SetLanguageController < ApplicationController
  def spanish
    I18n.locale = :es
    set_session_and_redirect
  end

  def english
    I18n.locale = :en
    set_session_and_redirect
  end

  private
  def set_session_and_redirect
    session[:locale] = I18n.locale
    redirect_back(fallback_location: authenticated_root_url)
  end
end
