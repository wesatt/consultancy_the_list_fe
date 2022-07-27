class UserService < BaseService

  def self.get_all_users
    response = conn_list.get("users")
    data = get_json(response)[:data]
  end
end
