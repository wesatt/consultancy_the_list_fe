require 'rails_helper'
# save_and_open_page

RSpec.describe "Books search results page", type: :feature do
  it 'will display a list of books, and authors' do
    #mock search hit?
    visit '/books'

    expect(page).to have_content("The Book Thief")
    expect(page).to have_content("Markus Zusak")
  end
end
