class UsersController < ApplicationController

  def show
    auth_hash = request.env['omniauth.auth']
    if auth_hash['credentials']['token'].present?
      @email = auth_hash['info']['email'] #how to use find_or_create_by/create facade method with conditional?
      @name = auth_hash['info']['name']
      redirect_to '/dashboard'
    end
  end
end
