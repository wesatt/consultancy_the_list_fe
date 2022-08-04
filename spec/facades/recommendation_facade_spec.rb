# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecommendationFacade, :vcr do
  it ".get_user_recs(id) returns a hash of all of a user's recommendations" do
    rec_hash = RecommendationFacade.get_user_recs(1)

    expect(rec_hash).to be_a(Hash)
    expect(rec_hash[:movie]).to be_a(Array)
    expect(rec_hash[:book]).to be_a(Array)
    expect(rec_hash[:movie]).to be_all(Recommendation)
    expect(rec_hash[:book]).to be_all(Recommendation)
  end

  it '.create_recommendations(params, current_user) returns an array of created recommendation hashes' do
    params = {
      recommended: ['2'],
      media_id: '11868',
      title: 'Dracula',
      media_type: 'movie'
    }
    current_user = {
      'id' => '1',
      'name' => 'Wes',
      'email' => 'someguy@dude.net'
    }
    created_recs = RecommendationFacade.create_recommendations(params, current_user)

    expect(created_recs).to be_a(Array)
    expect(created_recs.first).to be_a(Hash)
    expect(created_recs.first[:data]).to be_a(Hash)
    expect(created_recs.first[:data].keys).to include(:id, :type, :attributes)
    expect(created_recs.first[:data][:attributes]).to be_a(Hash)
    expect(created_recs.first[:data][:attributes].keys).to include(
      :media_id, :title, :media_type, :recommended_by_id, :status, :user_id
    )
  end
end
