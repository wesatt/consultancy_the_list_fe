require 'rails_helper'
# save_and_open_page

RSpec.describe "Books search results page", type: :feature do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
  end

  it 'will display a list of books, and authors', :vcr do
    books = BookFacade.create_book_results("The Book Thief")
    allow(BookFacade).to receive(:create_book_results).and_return(books)
    visit '/books'

    expect(page).to have_content("The Book Thief")
    expect(page).to have_content("Markus Zusak")
  end

  it 'Has the books title as a link to its show page', :vcr do
    books = BookFacade.create_book_results("The Book Thief")
    allow(BookFacade).to receive(:create_book_results).and_return(books)
    visit '/books'

    within page.all('.bookResults')[0] do
      expect(page).to have_link("The Book Thief")
      click_link("The Book Thief")

      expect(page).to have_current_path('/books/OL5819456W') #identifier from api as id
    end
  end
end
