# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecommendationFacade, :vcr do
  it ".get_user_recs(id) returns a hash of all of a user's recommendations" do
    movie_rec = {
      id: '1',
      type: 'recommendation',
      attributes: {
        media_id: '11868',
        title: 'Dracula',
        media_type: 'movie',
        recommended_by_id: 13,
        status: 'pending',
        user_id: 1
      }
    }
    recommendation = Recommendation.new(movie_rec)
    user_recs = { movie: [recommendation], book: [] }
    allow(RecommendationFacade).to receive(:get_user_recs).and_return(user_recs)
    rec_hash = RecommendationFacade.get_user_recs(1)

    expect(rec_hash).to be_a(Hash)
    expect(rec_hash[:movie]).to be_a(Array)
    expect(rec_hash[:book]).to be_a(Array)
    expect(rec_hash[:movie]).to be_all(Recommendation)
    expect(rec_hash[:book]).to be_all(Recommendation)
  end

  it '.create_recommendations(params, current_user) returns an array of created recommendation hashes' do
    params = {
      'recommended' => ['2'],
      'movie_id' => '11868',
      'movie_title' => 'Dracula',
      'media_type' => 'movie'
    }
    current_user = {
      'id' => '1',
      'name' => 'Wes',
      'email' => 'someguy@dude.net'
    }
    return_value = [{ data: { id: '16',
                              type: 'recommendation',
                              attributes: { media_id: '11868',
                                            title: 'Dracula',
                                            media_type: 'movie',
                                            recommended_by_id: 1,
                                            status: 'pending',
                                            user_id: 2 } } }]

    allow(RecommendationFacade).to receive(:create_recommendations).and_return(return_value)
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
