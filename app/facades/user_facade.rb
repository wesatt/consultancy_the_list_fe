class UserFacade
  def self.create_user(user_id)
    json = UserService.get_user(user_id)
    User.new(json)
  end
end
