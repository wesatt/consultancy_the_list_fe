class UsersController < ApplicationController
  before_action :current_user, :session_auth, except: :index

  def index
    auth_hash = request.env['omniauth.auth']
    if auth_hash['credentials']['token'].present?
      email = auth_hash['info']['email']
      name = auth_hash['info']['name']
      user = UserFacade.find_or_create_user({name: name, email: email})
      session[:user] = user
      redirect_to '/dashboard'
    end
  end

  def show
    @user = current_user
    @recommendations = RecommendationFacade.get_user_recs(@user['id'].to_i)
  end
end
