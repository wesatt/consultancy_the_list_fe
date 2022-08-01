class RecommendationsController < ApplicationController

  def create
    UserFacade.create_recommendations(params, current_user)
    redirect_to '/dashboard'
  end
end
