class MovieService < BaseService
  def self.top_rated
    response = conn_tmdb.get('movie/top_rated')
    json = get_json(response)
    json[:results]
  end

  def self.movie_lookup(id)
    response = conn_tmdb.get("movie/#{id}")
    get_json(response)
  end

  def self.movie_search(search_params)
    response = conn_tmdb.get("search/movie?query=#{search_params}")
    json = get_json(response)
    json[:results]
  end
end
