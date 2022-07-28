class UsersController < ApplicationController

  def show
    auth_hash = request.env['omniauth.auth']
    if auth_hash['credentials']['token'].present?
      email = auth_hash['info']['email']
      name = auth_hash['info']['name']
      UserFacade.find_or_create_user({name: name, email: email})
      redirect_to '/dashboard'
    end
  end
end
