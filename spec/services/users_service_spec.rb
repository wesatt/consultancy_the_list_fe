require 'rails_helper'

RSpec.describe UserService, :vcr do
  describe 'All users endpoint' do
    it 'can retrieve a list of all users from users index endpoint' do
      json = UserService.get_all_users

      expect(json).to be_an(Array)
      expect(json[0]).to have_key(:attributes)
      expect(json[0][:attributes]).to have_key(:name)
      expect(json[0][:attributes]).to have_key(:email)
    end
  end
end
