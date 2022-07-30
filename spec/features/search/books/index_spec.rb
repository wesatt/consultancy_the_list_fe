require 'rails_helper'
# save_and_open_page

RSpec.describe "Book Search Page", type: :feature do
  it 'has a search box' do
    allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
    visit '/search/books'

    expect(page).to have_field('Title')
    expect(page).to have_button('Search Titles')
  end
end
