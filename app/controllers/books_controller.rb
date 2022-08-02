class BooksController < ApplicationController
  before_action :session_auth

  def index
    if !params[:search].blank?
      @books = BookFacade.create_book_results(params[:search])
    else
      redirect_to "/search/books", notice: 'Search cannot be blank.'
    end
  end

  def show
    @book = BookFacade.create_book_details(params[:id])
  end
end
