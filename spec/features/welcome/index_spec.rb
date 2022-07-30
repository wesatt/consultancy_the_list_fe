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

    it 'sign in button redirects to google oauth page', :vcr do
      OmniAuth.config.test_mode = true
      OmniAuth.config.silence_get_warning = true
      OmniAuth.config.mock_auth[:google_oauth2] =
        OmniAuth::AuthHash.new(omni_auth_hash)

      visit '/'

      click_button('Login with Google')

      save_and_open_page

      expect(page).to have_current_path('/dashboard')
    end
  end
end
