class SessionsController < ApplicationController
  def destroy
    # reset_session Nope
    # session.clear
    session.destroy
    redirect_to '/'
  end
end
