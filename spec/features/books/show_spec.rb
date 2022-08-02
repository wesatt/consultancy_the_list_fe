require 'rails_helper'
# save_and_open_page

RSpec.describe "Books show page", type: :feature do
  describe 'happy paths' do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
    end
    it 'displays more details about a single book', :vcr do
      visit '/books/LnVPj0lN0eIC'

      expect(page).to have_content("Krampus")
      expect(page).to have_content("The Yule Lord")
      expect(page).to have_content("Brom")
      expect(page).to have_content("Terrific. A wild ride….I loved it.")
      expect(page).to have_content("3.5/5")
      expect(page).to have_content("Number of Pages: 368")
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
      visit 'books/mEQ8DQYchtcC'

      expect(page).to have_content("No-Image-List.png")
    end
  end
end
