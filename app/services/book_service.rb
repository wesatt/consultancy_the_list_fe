class BookService < BaseService

  def self.get_search_books(search_query)
    response = conn_book.get("search.json?q=#{search_query}")
    data = get_json(response)[:docs]
  end
end
