require 'rails_helper'
# save_and_open_page

RSpec.describe 'Welcome page', type: :feature do
  describe 'Google Oauth' do
    it 'has a button to login or sign up with google' do
      visit '/'

      expect(page).to have_button('Sign in or sign up with Google')
    end

    xit 'sign in button redirects to google oauth page', :vcr do
      visit '/'

      click_button('Sign in or sign up with Google')

      # Capybara.current_driver = :selenium
      # Capybara.app_host = 'https://www.accounts.google.com'

      expect(page).to have_current_path("https://accounts.google.com/o/auth/google_oauth2")
    end
  end
end
