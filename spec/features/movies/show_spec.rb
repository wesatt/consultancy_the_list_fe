require 'rails_helper'

RSpec.describe 'Movies Show Page', type: :feature do
  context 'not logged in' do
    xit 'trying to visit it directly returns you to the homepage if you are not logged in' do
      visit '/'
      expect(page).to_not have_content('Please login before trying to navigate')

      visit '/movies/11868'

      expect(page).to have_current_path('/')
      expect(page).to have_content('Please login before trying to navigate')
    end
  end

  context 'logged in' do
    #before(:each) do
      #allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
    #end

    xit 'has all the movie data for a specific movie' do
      visit "/movies/#{dracula[:id]}"

      expect(page).to have_current_path('/')
      expect(page).to have_content(dracula[:title])
      expect(page).to have_content(dracula[:overview])
      expect(page).to have_content(dracula[:release_date])
      expect(page).to have_content(dracula[:vote_average])
    end

    xit 'has a list of friends that you can make recommendations to' do
      friend1 = User.new(id: 1, name: 'Christopher Lee', email: 'dracula@hammer.com')
      friend2 = User.new(id: 2, name: 'Peter Cushing', email: 'helsing@hammer.com')
      visit "/movies/#{dracula[:id]}"

      expect(page).to have_content(friend1.name)
      expect(page).to have_content(friend2.name)
    end

    xit 'has a checkbox and button that you cannuse to make recommendations' do
      friend1 = User.new(id: 1, name: 'Christopher Lee', email: 'dracula@hammer.com')
      friend2 = User.new(id: 2, name: 'Peter Cushing', email: 'helsing@hammer.com')
      visit "/movies/#{dracula[:id]}"

      within "#friend-id-#{friend1.id}" do
        expect(page).to have_content(friend1.name)
        check('recommended[]')
      end

      within "#friend-id-#{friend2.id}" do
        expect(page).to have_content(friend2.name)
      end

      click_button('Recommend')

      expect(page).to have_current_path('/dashboard')
      within "#recommendations-#{friend1.id}" do
        expect(page).to have_content("You recommended Dracula to #{friend1.name}")
      end
    end
  end
end
