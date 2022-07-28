require 'rails_helper'

RSpec.describe "Welcome Page", type: :feature do
  it 'has an About Us section with info about the app' do
    visit root_path

    expect(page).to have_content("Welcome to The List!")
    expect(page).to have_content("About Us")
    expect(page).to have_content("An app to recommend and share your favorite books and movies with friends! Register or log in with Google.")
    expect(page).to_not have_content("Logout")
  end

  it 'has a button to sign in with Google' do
    visit root_path

    expect(page).to have_button("Sign In with Google")
    click_button("Sign In with Google")
    expect(current_path).to eq('/login')
  end
end
