require 'rails_helper'

RSpec.describe 'Movies Index (search results) Page', type: :feature do
  context 'not logged in' do
    xit 'trying to visit it directly returns you to the homepage if you are not logged in' do
      visit '/'
      expect(page).to_not have_content('Please login before trying to navigate')

      visit '/movies'

      expect(page).to have_current_path('/')
      expect(page).to have_content('Please login before trying to navigate')
    end
  end

  context 'logged in' do
    #before(:each) do
      #allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
    #end

    xit 'returns search results from the search/movies page' do
      visit '/search/movies'

      fill_in(:search, with: 'dracula')
      click_button('Search Movies')

      expect(current_path).to eq('/movies')
      expect(page).to have_content('Dracula')
    end

    xit "has links to each result's show page" do
      visit '/search/movies'

      fill_in(:search, with: 'dracula')
      click_button('Search Movies')

      expect(current_path).to eq('/movies')
      expect(page).to have_link('Dracula')
      expect(page).to have_content('Release Date:', count: 20)

      within '#movie-result-0' do
        click_link('Dracula')
      end

      # expecting the test below to fail...need to retrieve media ID during test run
      expect(page).to have_current_path('/movies/11868')
    end
  end
end
