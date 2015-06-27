class SetLanguageController < ApplicationController
  def en
    I18n.locale = :en
    set_session_and_redirect
  end

  def pl
    I18n.locale = :pl
    set_session_and_redirect
  end

  private

  def set_session_and_redirect
    session[:locale] = I18n.locale
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to
  end
end
