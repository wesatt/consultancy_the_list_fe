class RecommendationService < BaseService
  def self.get_user_recs(id)
    response = conn_list.get("users/#{id}/recommendations")
    get_json(response)[:data] # Returns array of recommendations
  end

  def self.post_recommendation(media_data, rec_to_id)
    response = conn_list.post("users/#{rec_to_id}/recommendations") do |req|
      # req.params['recommendation'] = media_data
      req.params = media_data
      req.headers['Content-Type'] = 'application/json'
    end
    get_json(response)
  end
end
