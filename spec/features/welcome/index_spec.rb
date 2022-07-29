require 'rails_helper'
# save_and_open_page

RSpec.describe "Welcome Page", type: :feature do
  it 'has an About Us section with info about the app' do
    visit root_path

    expect(page).to have_content("Welcome to The List!")
    expect(page).to have_content("About Us")
    within '#about-us' do
      expect(page).to have_content("An app to recommend and share your favorite books and movies with friends! Register or log in with Google.")
    end
    expect(page).to_not have_content("Logout")
  end

  describe 'Google Oauth' do
    it 'has a button to login or sign up with google' do
      visit '/'

      expect(page).to have_button('Login with Google')
    end

    # xit 'sign in button redirects to google oauth page', :vcr do
    #   visit '/'

    #   click_button('Sign in or sign up with Google')

    #   # Capybara.current_driver = :selenium
    #   # Capybara.app_host = 'https://www.accounts.google.com'

    #   expect(page).to have_current_path("https://accounts.google.com/o/auth/google_oauth2")
    # end
  end
end
