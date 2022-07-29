require 'rails_helper'
# save_and_open_page

RSpec.describe "Book Search Page", type: :feature do
  it 'has a search box' do
    visit '/search/books'
    save_and_open_page

    expect(page).to have_field('Title')
    expect(page).to have_button('Search Titles')
  end
end
