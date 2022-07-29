class MovieFacade
  def self.top_rated
    json = MovieService.top_rated
    json.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_lookup(id)
    movie_data = MovieService.movie_lookup(id)
    Movie.new(movie_data)
  end

  def self.movie_search(search_params)
    json = MovieService.movie_search(search_params)
    json.map do |movie_data|
      Movie.new(movie_data)
    end
  end

end
