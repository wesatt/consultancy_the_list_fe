class MoviesController < ApplicationController
  before_action :session_auth, :current_user

  def index
    if !params[:search].empty?
      @movies = MovieFacade.movie_search(params[:search])
    else
      redirect_to "/search/movies", notice: 'Search cannot be blank.'
    end
  end

  def show
    @movie = MovieFacade.movie_lookup(params[:id])
    @users = UserFacade.list_all_users
  end
end
