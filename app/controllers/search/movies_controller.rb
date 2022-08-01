class Search::MoviesController < ApplicationController
  before_action :session_auth, :current_user

  def index
  end
end
