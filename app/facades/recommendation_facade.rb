class RecommendationFacade
  def self.get_user_recs(id)
    json = RecommendationService.get_user_recs(id)
    media = {movie: [], book: []}
    json.map do |rec|
      # binding.pry
      media[:movie] << Recommendation.new(rec) if rec[:attributes][:media_type] == 'movie'
      media[:book] << Recommendation.new(rec) if rec[:attributes][:media_type] == 'book'
    end
    media
  end

  # def self.get_collection_recs(id, media)
  #   x = get_user_recs(id)
  #   x.collect(|poro| poro.media_type == media)
  # end

  def self.create_recommendations(params, current_user)
    data = {
      media_id: params[:media_id],
      title: params[:title],
      media_type: params[:media_type],
      recommended_by_id: current_user['id'].to_i
    }
    params[:recommended].map do |rec_id|
      RecommendationService.post_recommendation(data, rec_id)
    end
  end
end
