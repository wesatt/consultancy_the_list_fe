class BaseService
  def self.conn_list
    # Faraday.new(url: "https://the-list-be.herokuapp.com/api/v1/")
    Faraday.new(url: "http://localhost:3000/api/v1/")
  end

  def self.conn_book
    Faraday.new(url: "https://www.googleapis.com/books/v1/")
  end

  def self.conn_tmdb
    Faraday.new('https://api.themoviedb.org/3/') do |req|
      req.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
