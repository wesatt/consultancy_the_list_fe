class RecommendationsController < ApplicationController

  def create
    if params[:recommended].blank?
      redirect_to "/#{params[:media_type]}s/#{params[:media_id]}", notice: 'You must select someone to make a recommendation.'
    else
      RecommendationFacade.create_recommendations(params, current_user)
      redirect_to '/dashboard'
    end
  end

  def update
    RecommendationFacade.update_recomm_status(params, current_user)
    redirect_to '/dashboard'
  end
end
