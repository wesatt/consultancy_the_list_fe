class MoviesController < ApplicationController
  before_action :session_auth

  def index
    @movies = MovieFacade.movie_search(params[:search])
  end

  def show
  end
end
