require 'rails_helper'

RSpec.describe MovieService, :vcr do
  describe 'connection' do
    it 'establishes the connection to The Movie Database' do
      expect(MovieService.conn_tmdb).to be_a(Faraday::Connection)
    end
  end

  describe 'movie endpoints' do
    it '.top_rated returns a json for the top rated movies for browsing' do
      json_return = MovieService.top_rated

      expect(json_return).to be_a(Array)
      expect(json_return.first).to be_a(Hash)
      expect(json_return.first).to include(:id, :title, :poster_path, :overview, :vote_average)
    end

    it '.movie_lookup(id) returns a json for the specific movie' do
      json_return = MovieService.movie_lookup(11_868)

      expect(json_return).to be_a(Hash)
      expect(json_return).to include(:title, :runtime, :poster_path, :overview, :genres, :vote_average)
    end

    it '.search_movies(arg) returns a json for the specified arguments' do
      json_return = MovieService.search_movies('dracula')

      expect(json_return).to be_a(Array)
      expect(json_return.first).to be_a(Hash)
      expect(json_return.first).to include(:id, :title, :poster_path, :overview, :vote_average)
    end
  end
end
