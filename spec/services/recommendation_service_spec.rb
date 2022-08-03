# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecommendationService, :vcr do
  it ".get_user_recs(id) returns a json of all of a user's recommendations" do
    user_recs_json = [
      { id: '1',
        type: 'recommendation',
        attributes: { media_id: '11868', title: 'Dracula', media_type: 'movie', recommended_by_id: 13,
                      status: 'pending', user_id: 1 } },
      { id: '3',
        type: 'recommendation',
        attributes: { media_id: '654810', title: 'Lasagna', media_type: 'movie', recommended_by_id: 5,
                      status: 'pending', user_id: 1 } },
      { id: '4',
        type: 'recommendation',
        attributes: { media_id: '545611', title: 'Everything Everywhere All at Once', media_type: 'movie',
                      recommended_by_id: 6, status: 'pending', user_id: 1 } },
      { id: '8',
        type: 'recommendation',
        attributes: { media_id: '354333', title: 'Spike', media_type: 'movie', recommended_by_id: 8,
                      status: 'pending', user_id: 1 } },
      { id: '10',
        type: 'recommendation',
        attributes: { media_id: '8067', title: 'A Life Less Ordinary', media_type: 'movie', recommended_by_id: 8,
                      status: 'pending', user_id: 1 } }
    ]
    allow(RecommendationService).to receive(:get_user_recs).and_return(user_recs_json)
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
    return_value = { data: { id: '16',
                             type: 'recommendation',
                             attributes: { media_id: '11868',
                                           title: 'Dracula',
                                           media_type: 'movie',
                                           recommended_by_id: 1,
                                           status: 'pending',
                                           user_id: 2 } } }

    allow(RecommendationService).to receive(:post_recommendation).and_return(return_value)
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
