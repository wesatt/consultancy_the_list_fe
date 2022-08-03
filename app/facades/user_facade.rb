class UserFacade
  def self.find_user(user_id)
    json = UserService.get_user(user_id)
    User.new(json)
  end

  def self.find_or_create_user(user_data)
    json = UserService.post_user(user_data)
    User.new(json)
  end

  def self.list_all_users
    json = UserService.get_all_users
    json.map { |data| User.new(data)}
  end

  # put this into a RecommendationFacade
  def self.create_recommendations(params, current_user)
    data = {
      media_id: params[:media_id].to_i,
      title: params[:title],
      media_type: params[:media_type],
      recommended_by_id: current_user['id'].to_i
    }
    params[:recommended].map do |rec_id|
      UserService.post_recommendation(data, rec_id)
    end
  end
end
