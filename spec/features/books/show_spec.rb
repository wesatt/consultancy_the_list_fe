require 'rails_helper'
# save_and_open_page

RSpec.describe "Books show page", type: :feature do
  describe 'happy paths' do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
      users = UserFacade.list_all_users
      @friend1 = users.first
      @friend2 = users.second
      test_user = users.third
      @hash = {'email' => test_user.email, 'name' => test_user.name, 'id' => test_user.id}
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@hash)
    end

    it 'displays more details about a single book', :vcr do
      visit '/books/LnVPj0lN0eIC'

      expect(page).to have_content("Krampus")
      expect(page).to have_content("The Yule Lord")
      expect(page).to have_content("Brom")
      expect(page).to have_content("Terrific. A wild ride….I loved it.")
      expect(page).to have_content("3.5/5")
      expect(page).to have_content("Number of Pages368")
    end

    describe 'recommendations section', :vcr do
      before(:each) do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@hash)
        visit '/books/LnVPj0lN0eIC'
      end

      it 'has a list of users to recommend the book to' do
        expect(page).to have_content(@friend1.name)
        expect(page).to have_content(@friend2.name)
      end

      it 'can select friends to recommend books to, and route to dash' do

        within "#friend-id-#{@friend1.id}" do
          expect(page).to have_content(@friend1.name)
          check('recommended[]')
        end

        within "#friend-id-#{@friend2.id}" do
          expect(page).to have_content(@friend2.name)
        end

        click_button('Recommend')

        expect(page).to have_current_path('/dashboard')
      end
    end
  end

  describe 'Sad path/ Edgecases' do
    it 'will redirect a user who is not logged in to root' do
      visit '/books/LnVPj0lN0eIC'


      expect(page).to have_current_path('/')
      expect(page).to have_content("Please login before trying to navigate")
    end

    it 'will show the alt image if no image is found', :vcr do
        allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user = {'id' => '1', 'name' => 'Wes', 'email' => 'someguy@dude.net'})

      visit 'books/mEQ8DQYchtcC'

      within '.bookCover' do
      expect(page.find('img')['src']).to match("/assets/No-Image-List*")
      end
    end
  end
end
