class RecommendationsController < ApplicationController

  def create
    if params[:recommended].blank?
      redirect_to "/#{params[:media_type]}s/#{params[:media_id]}", notice: 'You must select someone to make a recommendation.'
    else
      UserFacade.create_recommendations(params, current_user)
      redirect_to '/dashboard'
    end
  end
end
