class BooksController < ApplicationController
  before_action :session_auth

  def index
    @books = BookFacade.create_book_results(params[:title])
  end

  def show
  end

end
