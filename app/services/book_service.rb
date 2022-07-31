class BookService < BaseService

  def self.get_search_books(search_query)
    response = conn_book.get("volumes?q=#{search_query}")
    data = get_json(response)[:items]
  end

  def self.get_book_details(id)
    response = conn_book.get("volumes/#{id}")
    data = get_json(response)
  end
end
