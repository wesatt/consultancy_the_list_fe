require 'rails_helper'
# save_and_open_page

RSpec.describe "Books search results page", type: :feature do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user = {'id' => '13', 'name' => 'Wes', 'email' => 'someguy@dude.net'})

  end

  it 'will display a list of books, and authors', :vcr do
    books = BookFacade.create_book_results("The Book Thief")
    allow(BookFacade).to receive(:create_book_results).and_return(books)
    visit '/books?search=the+book+thief'

    expect(page).to have_content("The Book Thief")
    expect(page).to have_content("Markus Zusak")
    expect(page).to have_content("2014-05-27")
  end

  it 'Has the books title as a link to its show page', :vcr do
    books = BookFacade.create_book_results("The Book Thief")
    allow(BookFacade).to receive(:create_book_results).and_return(books)
    visit '/books?search=the+book+thief'

    within '.bookResults-rk2MDQAAQBAJ' do
      expect(page).to have_link("The Book Thief")
      click_link("The Book Thief")
      expect(page).to have_current_path('/books/rk2MDQAAQBAJ') #identifier from api as id
    end

  end

  describe 'Edge Cases and Sad paths' do
    before(:each) do
      @books = [Book.new({id: "Sumthin'",
                            volumeInfo: {
                              title: "Frogs, meet Clogs",
                              authors: []}})]

      allow(BookFacade).to receive(:create_book_results).and_return(@books)
      visit '/books?search=oranges'
    end

    it 'will show N/A for an author if one is not listed', :vcr do
      expect(page).to have_content("Author(s): N/A")
    end

    it 'will show N/A for a date if one is not listed', :vcr do
      expect(page).to have_content("Date Published: N/A")
    end
  end
end
