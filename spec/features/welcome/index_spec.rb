require 'rails_helper'

RSpec.describe "Welcome Page", type: :feature do
  it 'has an About Us section with info about the app' do
    visit root_path

    expect(page).to have_content("Welcome to The List!")
    expect(page).to have_content("About Us")
    within '#about-us' do
      expect(page).to have_content("An app to recommend and share your favorite books and movies with friends! Register or log in with Google.")
    end
    expect(page).to_not have_content("Logout")
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
