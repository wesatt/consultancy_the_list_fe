class RecommendationService < BaseService
  def self.get_user_recs(id)
    response = conn_list.get("users/#{id}/recommendations")
    get_json(response)[:data] # Returns array of recommendations
  end
end
