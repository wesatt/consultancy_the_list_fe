require 'rails_helper'
# save_and_open_page

RSpec.describe "Books show page", type: :feature do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
  end

  it 'displays more details about a single book' do
    visit '/books/LnVPj0lN0eIC'

    expect(page).to have_content("Krampus")
    expect(page).to have_content("The Yule Lord")
    expect(page).to have_content("Brom")
    expect(page).to have_content("Terrific. A wild ride….I loved it.")
  end
end
