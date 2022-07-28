require 'rails_helper'

RSpec.describe UserFacade, :vcr do
  it 'creates a User poro from single user call' do
    user_id = 3
    user = UserFacade.create_user(user_id)

    expect(user).to be_an_instance_of(User)
  end
end
