require "rails_helper"

RSpec.describe 'the application layout page', type: :feature do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return({name: "name", email: "email", id: "id"})
  end

  it 'has a button to logout from welcome page if user is logged in' do
    visit '/'

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)#simulating destroy action, tested in browser, functioning as expected

    click_link("Log Out")

    expect(current_path).to eq('/')
    expect(page).to_not have_button("Log Out")
    expect(page).to have_button("Login with Google")
  end
end
