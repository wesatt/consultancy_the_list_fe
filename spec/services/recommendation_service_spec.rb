# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecommendationService, :vcr do
  it ".get_user_recs(id) returns a json of all of a user's recommendations" do
    rec_json = RecommendationService.get_user_recs(1)

    expect(rec_json).to be_a(Array)
    expect(rec_json).to be_all(Hash)
    expect(rec_json.first.keys).to include(:id, :type, :attributes)
    expect(rec_json.first[:attributes]).to be_a(Hash)
    expect(rec_json.first[:attributes].keys).to include(
      :media_id, :title, :media_type, :recommended_by_id, :status, :user_id
    )
  end

  it '.post_recommendation(media_data, rec_to_id) creates a recommendation and returns a json hash' do
    media_data = {
      media_id: 11_868,
      title: 'Dracula',
      media_type: 'movie',
      recommended_by_id: 1
    }
    rec_to_id = '2'
    created_rec = RecommendationService.post_recommendation(media_data, rec_to_id)

    expect(created_rec).to be_a(Hash)
    expect(created_rec[:data]).to be_a(Hash)
    expect(created_rec[:data].keys).to include(:id, :type, :attributes)
    expect(created_rec[:data][:attributes]).to be_a(Hash)
    expect(created_rec[:data][:attributes].keys).to include(
      :media_id, :title, :media_type, :recommended_by_id, :status, :user_id
    )
  end
end
