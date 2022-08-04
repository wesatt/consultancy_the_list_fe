class SessionsController < ApplicationController
  def destroy
    # reset_session
    # session.clear
    # session.delete(:user)
    # @current_user = nil
    session.destroy
    redirect_to '/'
  end
end
