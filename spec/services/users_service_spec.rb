require 'rails_helper'

RSpec.describe UserService, :vcr do
  describe 'All users endpoint' do
    it 'can retrieve a list of all users from list api' do
      json = UserService.get_all_users

      expect(json).to be_an(Array)
      expect(json[0]).to have_key(:attributes)
      expect(json[0][:attributes]).to have_key(:name)
      expect(json[0][:attributes]).to have_key(:email)
    end
  end
  describe 'Single User Endpoint' do
    it 'can retrieve a single user from list api endpoint' do
      json = UserService.get_user(2)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:attributes)
      expect(json[:attributes]).to have_key(:name)
      expect(json[:attributes]).to have_key(:email)
    end
  end
end
