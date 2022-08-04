class SessionsController < ApplicationController
  def destroy
    reset_session
    # session.clear
    # session.destroy
    redirect_to '/'
  end
end
