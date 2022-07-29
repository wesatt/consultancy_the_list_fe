class MovieFacade
  def self.top_rated
    json = MovieService.top_rated
    json.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_lookup(id)
    json = MovieService.movie_lookup(id)
  end

  def self.movie_search(search_params)
    json = MovieService.movie_search(search_params)
  end

end
