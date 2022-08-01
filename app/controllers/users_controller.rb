class UsersController < ApplicationController
  before_action :current_user, :session_auth, except: :index

  def index
    auth_hash = request.env['omniauth.auth']
    if auth_hash['credentials']['token'].present?
      email = auth_hash['info']['email']
      name = auth_hash['info']['name']
      # token = auth_hash['credentials']['token'] #if unused remove?
      user = UserFacade.find_or_create_user({name: name, email: email})
      # session[:user_id] = user.id.to_i #do we need both?
      session[:user] = user
      redirect_to '/dashboard'
    end
  end

  def show
    @user = current_user
  end
end
