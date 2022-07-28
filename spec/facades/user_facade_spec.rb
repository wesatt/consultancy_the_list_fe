require 'rails_helper'

RSpec.describe UserFacade, :vcr do
  it 'creates a User poro from single user call' do #double check if used, might be replaced by focu
    user_id = 3
    user = UserFacade.find_user(user_id)

    expect(user).to be_an_instance_of(User)
  end

  it 'creates a single poro from a find or create call' do
    user_data = {name: "Jimbob Dudeguy", email: "Itsjim@yahoo.com"}
    user = UserFacade.find_or_create_user(user_data)

    expect(user).to be_an_instance_of(User)
  end

  it 'creates an array of poros from the get all users call' do
    users = UserFacade.list_all_users

    expect(users).to be_an(Array)
    expect(users).to be_all(User)
  end
end
