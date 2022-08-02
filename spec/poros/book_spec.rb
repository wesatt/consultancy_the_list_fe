require 'rails_helper'

RSpec.describe Book do
  it 'exists with attributes' do
    data = {
            id: "Jumble",
            volumeInfo: {
                title: "Frogs, meet Clogs",
                authors: [
                    "Deannah"
                ],
                description: "Not Much to say about it.",
                subtitle: "It's about frogs",
                publishedDate: "2022-03-15",
                pageCount: "75",
                averageRating: "5",
                imageLinks: {
                  medium: "Reallylonguri"
                }
            }
        }
    book = Book.new(data)
    expect(book).to be_a(Book)
    expect(book.id).to eq("Jumble")
    expect(book.title).to eq("Frogs, meet Clogs")
    expect(book.author).to eq(["Deannah"])
    expect(book.description).to eq("Not Much to say about it.")
    expect(book.subtitle).to eq("It's about frogs")
    expect(book.published_date).to eq("2022-03-15")
    expect(book.page_count).to eq("75")
    expect(book.average_rating).to eq("5")
    expect(book.photo).to eq("Reallylonguri")
  end
  describe 'edge case tests' do
    before(:each) do
      data1 = {
              id: "Jumble",
              volumeInfo: {
                  title: "Frogs, meet Clogs",
                  authors: nil,
                  description: nil,
                  subtitle: nil,
                  publishedDate: nil,
                  pageCount: nil,
                  averageRating: nil,
                  imageLinks: {
                    medium: nil
                  }
              }
          }
      data2 = {
              id: "Jumble",
              volumeInfo: {
                  title: "Frogs, meet Clogs",
                  authors: [],
                  description: "",
                  publishedDate: "",
                  pageCount: "",
                  averageRating: ""}
          }

          @book1 = Book.new(data1)
          @book2 = Book.new(data2)
    end

    it 'will replace a nonexistant entry with N/A, and nonexistant subtitle/photo with nothing' do
        expect(@book1.author).to eq(["N/A"])
        expect(@book1.description).to eq("N/A")
        expect(@book1.subtitle).to eq(nil)
        expect(@book1.published_date).to eq("N/A")
        expect(@book1.page_count).to eq("N/A")
        expect(@book1.average_rating).to eq("N/A")
        expect(@book1.photo).to eq(nil)
    end

    it 'will replace an empty entry with N/A, and empty subtitle/photo with nothing' do
      expect(@book2.author).to eq(["N/A"])
      expect(@book2.description).to eq("N/A")
      expect(@book2.subtitle).to eq(nil)
      expect(@book2.published_date).to eq("N/A")
      expect(@book2.page_count).to eq("N/A")
      expect(@book2.average_rating).to eq("N/A")
      expect(@book2.photo).to eq(nil)
    end
  end
end
