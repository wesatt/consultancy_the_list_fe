class DashboardController < ApplicationController
  def index
    if session[:user]
      @user = session[:user]
    else
      redirect_to '/', notice: 'Please login before trying to navigate'
    end
  end
end
