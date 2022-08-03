# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies Show Page', :vcr, type: :feature do
  context 'not logged in' do
    it 'trying to visit it directly returns you to the homepage if you are not logged in' do
      visit '/'
      expect(page).to_not have_content('Please login before trying to navigate')

      visit '/movies/11868'

      expect(page).to have_current_path('/')
      expect(page).to have_content('Please login before trying to navigate')
    end
  end

  context 'logged in' do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
      users = UserFacade.list_all_users
      @friend1 = users.first
      @friend2 = users.second
      test_user = users.third
      hash = {'email' => test_user.email, 'name' => test_user.name, 'id' => test_user.id}
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(hash)
    end

    it 'has all the movie data for a specific movie' do
      visit "/movies/#{dracula[:id]}"

      expect(page).to have_content(dracula[:title])
      expect(page).to have_content(dracula[:overview])
      expect(page).to have_content(dracula[:release_date])
      expect(page).to have_content(dracula[:vote_average].round(1))
    end

    it 'has a list of friends that you can make recommendations to' do
      allow(UserFacade).to receive(:list_all_users).and_return([@friend1, @friend2])
      visit "/movies/#{dracula[:id]}"

      expect(page).to have_content(@friend1.name)
      expect(page).to have_content(@friend2.name)
    end

    it 'has a checkbox and button that you can use to make recommendations' do
      allow(UserFacade).to receive(:list_all_users).and_return([@friend1, @friend2])
      visit "/movies/#{dracula[:id]}"

      within "#friend-id-#{@friend1.id}" do
        expect(page).to have_content(@friend1.name)
        check('recommended[]')
      end

      within "#friend-id-#{@friend2.id}" do
        expect(page).to have_content(@friend2.name)
      end

      click_button('Recommend')

      expect(page).to have_current_path('/dashboard')
      # within "#recommendations-#{friend1.id}" do
      #   expect(page).to have_content("You recommended Dracula to #{friend1.name}")
      # end
    end
  end

  context 'logged in, no recommendation selections made' do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
      users = UserFacade.list_all_users
      @friend1 = users.first
      @friend2 = users.second
      test_user = users.third
      hash = {'email' => test_user.email, 'name' => test_user.name, 'id' => test_user.id}
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(hash)
    end

    it 'returns a sad path error when trying to recommend something without selecting anybody' do
      allow(UserFacade).to receive(:list_all_users).and_return([@friend1, @friend2])
      visit "/movies/#{dracula[:id]}"

      expect(page).to_not have_content('You must select someone to make a recommendation.')

      within "#friend-id-#{@friend1.id}" do
        expect(page).to have_content(@friend1.name)
      end

      within "#friend-id-#{@friend2.id}" do
        expect(page).to have_content(@friend2.name)
      end

      click_button('Recommend')

      expect(page).to have_current_path("/movies/#{dracula[:id]}")
      expect(page).to have_content('You must select someone to make a recommendation.')
    end
  end
end
