class BaseService
  def self.conn_list
    Faraday.new(url: "https://the-list-be.herokuapp.com/api/v1/")
  end

  def self.conn_tmdb
    Faraday.new('https://api.themoviedb.org/3/')
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
