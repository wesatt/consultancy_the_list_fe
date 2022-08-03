class Recommendation
  attr_reader :id,
              :media_id,
              :title,
              :media_type,
              :recommended_by_id,
              :status,
              :recommended_to_id

  def initialize(data)
    @id = data[:id]
    @media_id = data[:attributes][:media_id]
    @title = data[:attributes][:title]
    @media_type = data[:attributes][:media_type]
    @recommended_by_id = data[:attributes][:recommended_by_id]
    @status = data[:attributes][:status]
    @recommended_to_id = data[:attributes][:user_id]
  end
end
