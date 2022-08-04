require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  describe 'Facade methods' do
    # it '.top_rated returns an array of movie poros of the top 20 movies' do
    #   movies = MovieFacade.top_rated
    #
    #   expect(movies).to be_a(Array)
    #   expect(movies).to be_all(Movie)
    # end

    it '.movie_lookup(id) returns a single movie poros for the given id' do
      movie = MovieFacade.movie_lookup(11_868)

      expect(movie).to be_a(Movie)
    end

    it '.movie_search(search_params) returns an array of movie poros matching the given params' do
      movies = MovieFacade.movie_search('dracula')

      expect(movies).to be_a(Array)
      expect(movies).to be_all(Movie)
    end
  end
end
