class UserService < BaseService

  def self.get_all_users
    response = conn_list.get("users")
    data = get_json(response)[:data]
  end

  def self.get_user(id)
    response = conn_list.get("users/#{id}")
    data = get_json(response)[:data]
  end

  def self.post_user(user_data)
    response = conn_list.post('users') do |req|
      req.params['user'] = user_data
      req.headers['Content-Type'] = 'application/json'
    end
    data = get_json(response)[:data]
  end
end
