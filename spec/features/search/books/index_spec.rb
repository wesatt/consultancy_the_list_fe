require 'rails_helper'
# save_and_open_page

RSpec.describe "Book Search Page", type: :feature do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
  end

  it 'has a search box' do

    visit '/search/books'

    expect(page).to have_field(:search)
    expect(page).to have_button('Search Books by Title')
  end

  it 'will lead to a results page', :vcr do
    visit '/search/books'

    fill_in(:search, with: "Krampus")
    click_button('Search Books by Title')

    expect(current_path).to eq('/books')
  end

  it 'will not perform an empty search' do
    visit '/search/books'

    click_button('Search Books by Title')

    expect(current_path).to eq('/search/books')
    expect(page).to have_content("Search cannot be blank.")
  end
end
