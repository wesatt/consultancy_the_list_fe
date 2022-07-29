class BookFacade

  def self.create_book_results(search_query)
    json = BookService.get_search_books(search_query)
    json.map { |data| Book.new(data)}
  end

end
