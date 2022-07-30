require 'rails_helper'

RSpec.describe 'Movies Search Index Page', type: :feature do
  #before(:each) do
    #allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
  #end
  ##this is how we spoof passing the session auth!
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
