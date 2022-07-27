class UserService < BaseService

  def self.get_all_users
    response = conn_list.get("users")
    data = get_json(response)[:data]
  end

  def self.get_user(id)
    response = conn_list.get("users/#{id}")
    data = get_json(response)[:data]
  end
end
