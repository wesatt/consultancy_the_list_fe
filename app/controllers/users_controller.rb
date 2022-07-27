class UsersController < ApplicationController

  def show
    auth_hash = request.env['omniauth.auth']
    if auth_hash['credentials']['token'].present?
      @email = auth_hash['info']['email']
      @name = auth_hash['info']['name']
      binding.pry
      redirect_to '/dashboard'
    end
  end
end
