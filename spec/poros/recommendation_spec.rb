# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recommendation do
  it 'exists and has attributes' do
    movie_rec = {
      id: '1',
      type: 'recommendation',
      attributes: {
        media_id: '11868',
        title: 'Dracula',
        media_type: 'movie',
        recommended_by_id: 13,
        status: 'pending',
        user_id: 1,
        recommended_by_info: {name: "TheEnd",  email: "TheEnd@theend.end"}
      }
    }
    recommendation = Recommendation.new(movie_rec)

    expect(recommendation).to be_a(Recommendation)
    expect(recommendation.id).to eq('1')
    expect(recommendation.media_id).to eq('11868')
    expect(recommendation.title).to eq('Dracula')
    expect(recommendation.media_type).to eq('movie')
    expect(recommendation.recommended_by_id).to eq(13)
    expect(recommendation.status).to eq('pending')
    expect(recommendation.recommended_to_id).to eq(1)
  end
end
