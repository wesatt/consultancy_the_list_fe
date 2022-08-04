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
end
