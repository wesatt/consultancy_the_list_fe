# frozen_string_literal: true

class Movie
  attr_reader :adult,
              :backdrop_path,
              :genre_ids,
              :id,
              :original_language,
              :original_title,
              :overview,
              :popularity,
              :poster_path,
              :release_date,
              :title,
              :video,
              :vote_average,
              :vote_count

  def initialize(data)
    @adult = [:adult]
    @backdrop_path = [:backdrop_path]
    @genre_ids = [:genre_ids]
    @id = [:id]
    @original_language = [:original_language]
    @original_title = [:original_title]
    @overview = [:overview]
    @popularity = [:popularity]
    @poster_path = [:poster_path]
    @release_date = [:release_date]
    @title = [:title]
    @video = [:video]
    @vote_average = [:vote_average]
    @vote_count = [:vote_count]
  end
end
