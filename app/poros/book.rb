class Book
  attr_reader :key,
              :title,
              :author

  def initialize(data)
    @key = data[:key]
    @title = data[:title]
    @author = data[:author_name]
  end
end
