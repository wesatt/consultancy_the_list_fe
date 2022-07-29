class UsersController < ApplicationController

  def show
    auth_hash = request.env['omniauth.auth']
    binding.pry
    if auth_hash['credentials']['token'].present?
      email = auth_hash['info']['email']
      name = auth_hash['info']['name']
      token = auth_hash['credentials']['token']
      binding.pry
      user = UserFacade.find_or_create_user({name: name, email: email})
      binding.pry
      redirect_to '/dashboard'
    end
  end
end
