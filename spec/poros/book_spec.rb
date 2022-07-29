require 'rails_helper'

RSpec.describe Book do
  it 'exists with attributes' do
    data = {
            key: "Bunchastuff",
            title: "Book On Frog",
            author_name: "Deannah Burke"
          }
    book = Book.new(data)
    expect(book).to be_a(Book)
    expect(book.key).to eq("Bunchastuff")
    expect(book.title).to eq("Book On Frog")
    expect(book.author).to eq("Deannah Burke")
  end
end
