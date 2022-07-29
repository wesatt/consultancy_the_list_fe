require 'rails_helper'

RSpec.describe BookService, :vcr do
  describe 'search by phrase endpoint' do
    it 'can retrieve information from book search endpoint' do
      json = BookService.get_search_books("fish and chips")

      expect(json).to be_an(Array)
      expect(json[0]).to have_key(:title)
      expect(json[0]).to have_key(:author_name)
      expect(json[0]).to have_key(:key)
    end
  end
end
