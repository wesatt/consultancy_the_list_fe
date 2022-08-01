# frozen_string_literal: true

require 'rails_helper'


RSpec.describe 'Movies Search Index Page', :vcr, type: :feature do
  context 'not logged in' do
    it 'trying to visit it directly returns you to the homepage if you are not logged in' do
      visit '/'
      expect(page).to_not have_content('Please login before trying to navigate')

      visit '/search/movies'

      expect(page).to have_current_path('/')
      expect(page).to have_content('Please login before trying to navigate')
    end
  end

  context 'logged in' do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
    end

    it 'has a form to search movies by title' do
      visit '/search/movies'

      expect(current_path).to eq('/search/movies')
      expect(page).to have_field(:search)
      expect(page).to have_button('Search Movies')
    end

    it 'redirects to the show (results) page when the form is filled out and submitted' do
      visit '/search/movies'

      fill_in(:search, with: 'dracula')
      click_button('Search Movies')

      expect(current_path).to eq('/movies')
    end
  end
end
