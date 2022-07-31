require 'rails_helper'
# save_and_open_page

RSpec.describe "Book Search Page", type: :feature do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
  end

  it 'has a search box' do

    visit '/search/books'

    expect(page).to have_field('Title')
    expect(page).to have_button('Search Titles')
  end

  it 'will lead to a results page', :vcr do
    visit '/search/books'

    fill_in('Title', with: "Krampus")
    click_button('Search Titles')

    expect(current_path).to eq('/books')
  end
end
