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
  end
end
