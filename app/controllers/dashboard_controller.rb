class DashboardController < ApplicationController
  before_action :session_auth

  def index
    @user = session[:user]
  end
end
