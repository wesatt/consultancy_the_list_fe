require 'rails_helper'
# save_and_open_page

RSpec.describe 'Welcome page', type: :feature do
  describe 'Google Oauth' do
    it 'has a button to login or sign up with google' do
      visit '/'

      expect(page).to have_button('Sign in or sign up with Google')
    end
  end
end
