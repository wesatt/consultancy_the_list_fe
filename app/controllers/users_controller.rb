class UsersController < ApplicationController

  def show
    auth_hash = request.env['omniauth.auth']
    if auth_hash['credentials']['token'].present?
      email = auth_hash['info']['email']
      name = auth_hash['info']['name']
      token = auth_hash['credentials']['token']
      user = UserFacade.find_or_create_user({name: name, email: email})
      session[:user_id] = user.id.to_i
      session[:user] = user
      redirect_to '/dashboard'
    end
  end
end
