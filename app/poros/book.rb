class Book
  attr_reader :id,
              :title,
              :author,
              :description

  def initialize(data)
    @id = data[:id]
    @title = data[:volumeInfo][:title]
    @author = format_author(data[:volumeInfo][:authors])
    @description = data[:volumeInfo][:description]
  end

  def format_author(author)
    if author.nil? || author.empty?
      ["N/A"]
    else
      author
    end
  end
end
