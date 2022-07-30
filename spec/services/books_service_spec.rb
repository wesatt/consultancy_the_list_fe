require 'rails_helper'

RSpec.describe BookService, :vcr do
  describe 'search by phrase endpoint' do
    it 'can retrieve information from book search endpoint' do
      json = BookService.get_search_books("fish and chips")

      expect(json).to be_an(Array)
      expect(json[0]).to have_key(:id)

      expect(json[0]).to have_key(:volumeInfo)
      expect(json[0][:volumeInfo]).to have_key(:authors)
      expect(json[0][:volumeInfo]).to have_key(:title)
      expect(json[0][:volumeInfo]).to have_key(:description)
    end
  end
  describe 'Single book endpoint' do
    it 'can retrieve details for a book from a volume key endpoint' do
      json = BookService.get_book_details("LnVPj0lN0eIC")

      expect(json).to be_an(Hash)
      expect(json).to have_key(:id)
      expect(json).to have_key(:volumeInfo)
      expect(json[:volumeInfo]).to have_key(:authors)
      expect(json[:volumeInfo]).to have_key(:title)
      expect(json[:volumeInfo]).to have_key(:subtitle)
      expect(json[:volumeInfo]).to have_key(:description)
      expect(json[:volumeInfo]).to have_key(:publishedDate)
      expect(json[:volumeInfo]).to have_key(:pageCount)
      expect(json[:volumeInfo]).to have_key(:averageRating)
    end
  end
end
