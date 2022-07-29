require 'rails_helper'

RSpec.describe UserFacade, :vcr do
  it 'creates an array of book poros from a search call' do
    books = BookFacade.create_book_results("The Book Thief")

    expect(books).to be_an(Array)
    expect(books).to be_all(Book)
  end
end
