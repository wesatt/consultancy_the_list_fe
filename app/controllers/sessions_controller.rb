class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash['credentials']['token'].present?
      email = auth_hash['info']['email']
      name = auth_hash['info']['name']
      user = UserFacade.find_or_create_user({name: name, email: email})
      session[:user] = user
      redirect_to '/dashboard'
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end
end
