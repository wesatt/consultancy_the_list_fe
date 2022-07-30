class ApplicationController < ActionController::Base
  helper_method :session_auth, :current_user

  def session_auth
    redirect_to '/', notice: 'Please login before trying to navigate' unless session[:user]
  end

  def current_user
    @user = session[:user]
  end
end
