require 'rails_helper'

RSpec.describe 'Movies Search Index Page', type: :feature do
  xit 'has a form to search movies by title' do
    visit '/search/movies'

    expect(page).to have_button('Search Movies')
  end

  xit 'redirects to the show (results) page when the form is filled out and submitted' do
    visit '/search/movies'

    fill_in(:search, with: 'dracula')
    click_button('Search Movies')

    expect(current_path).to eq('/search/movies/')
  end
end
