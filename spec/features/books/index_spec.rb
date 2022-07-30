require 'rails_helper'
# save_and_open_page

RSpec.describe "Books search results page", type: :feature do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
  end

  it 'will display a list of books, and authors', :vcr do
    #mock search hit?
    books = BookFacade.create_book_results("The Book Thief")
    allow(BookFacade).to receive(:create_book_results).and_return(books)
    visit '/books'
    save_and_open_page

    expect(page).to have_content("The Book Thief")
    expect(page).to have_content("Markus Zusak")
  end
end
