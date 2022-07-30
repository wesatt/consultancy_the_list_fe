require 'rails_helper'

RSpec.describe Book do
  it 'exists with attributes' do
    data = {
            key: "/works/OL5819456W",
            title: "Book On Frog",
            author_name: "Deannah Burke"
          }
    book = Book.new(data)
    expect(book).to be_a(Book)
    expect(book.key).to eq("OL5819456W")
    expect(book.title).to eq("Book On Frog")
    expect(book.author).to eq("Deannah Burke")
  end

  it 'will not include /works/ in the key' do
    data = {
            key: "/works/OL5819456W",
            title: "Book On Frog",
            author_name: "Deannah Burke"
          }
    book = Book.new(data)
    expect(book.key).to eq("OL5819456W")
    expect(book.key).to_not eq("/works/OL5819456W")
  end
end
