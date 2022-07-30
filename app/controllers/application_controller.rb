class ApplicationController < ActionController::Base
  helper_method :session_auth

  def session_auth
    redirect_to '/', notice: 'Please login before trying to navigate' unless session[:user]
  end
end
