class Book
  attr_reader :key,
              :title,
              :author

  def initialize(data)
    @key = format_key(data[:key])
    @title = data[:title]
    @author = format_author(data[:author_name])
  end

  def format_key(key)
    key.sub('/works/', '')
  end

  def format_author(author)
    if author.nil? || author.empty?
      ["N/A"]
    else
      author
    end
  end
end
