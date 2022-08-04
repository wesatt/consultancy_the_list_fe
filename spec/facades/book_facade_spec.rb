require 'rails_helper'

RSpec.describe BookFacade, :vcr do
  it 'creates an array of book poros from a search call' do
    books = BookFacade.create_book_results("The Book Thief")

    expect(books).to be_an(Array)
    expect(books).to be_all(Book)
  end

  it 'creates a poro from an id call' do
    book = BookFacade.create_book_details("rk2MDQAAQBAJ")

    expect(book).to be_a(Book)
  end
end
