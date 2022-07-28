require 'rails_helper'
# save_and_open_page

RSpec.describe 'Welcome page', type: :feature do
  describe 'Google Oauth' do
    it 'has a button to login or sign up with google' do
      visit '/'

      expect(page).to have_button('Sign in or sign up with Google')
    end

    it 'sign in button redirects to google oauth page' do
      visit '/'

      click_button('Sign in or sign up with Google')

      expect(page).to have_current_path("/auth/google_oauth2")
    end
  end
end
