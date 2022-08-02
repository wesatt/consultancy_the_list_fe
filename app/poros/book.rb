class Book
  attr_reader :id,
              :title,
              :author,
              :description,
              :subtitle,
              :published_date,
              :page_count,
              :average_rating,
              :photo

  def initialize(data)
    @id = data[:id]
    @title = data[:volumeInfo][:title]
    @author = format_author(data[:volumeInfo][:authors])
    @description = format_entry(data[:volumeInfo][:description])
    @subtitle = data[:volumeInfo][:subtitle]
    @published_date = format_entry(data[:volumeInfo][:publishedDate])
    @page_count = format_entry(data[:volumeInfo][:pageCount])
    @average_rating = format_entry(data[:volumeInfo][:averageRating])
    @photo = format_photo(data[:volumeInfo][:imageLinks])
  end

  def format_author(author)
    if author.nil? || author.empty?
      ["N/A"]
    else
      author
    end
  end

  def format_entry(entry)
    if entry.blank?
      "N/A"
    else
      entry
    end
  end

  def format_photo(data)
    if data.nil? || data[:medium].nil?
      "No-Image-List.png"
    else
      data[:medium]
    end
  end
end
