class UsersController < ApplicationController
  before_action :current_user, :session_auth, except: :index

  def index
  end

  def show
    @user = current_user
    @recommendations = RecommendationFacade.get_user_recs(@user['id'].to_i)
  end
end
