class BaseService
  def self.conn_list
    Faraday.new(url: "http://localhost:3000/api/v1/")
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
