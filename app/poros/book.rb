class Book
  attr_reader :id,
              :title,
              :author,
              :description,
              :subtitle,
              :published_date,
              :page_count,
              :average_rating

  def initialize(data)
    @id = data[:id]
    @title = data[:volumeInfo][:title]
    @author = format_author(data[:volumeInfo][:authors])
    @description = data[:volumeInfo][:description]
    @subtitle = data[:volumeInfo][:subtitle]
    @published_date = data[:volumeInfo][:publishedDate]
    @page_count = data[:volumeInfo][:pageCount]
    @average_rating = data[:volumeInfo][:averageRating]
  end

  def format_author(author)
    if author.nil? || author.empty?
      ["N/A"]
    else
      author
    end
  end
end
