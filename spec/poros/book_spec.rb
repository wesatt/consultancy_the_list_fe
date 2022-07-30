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
                description: "Not Much to say about it."}
        }
    book = Book.new(data)
    expect(book).to be_a(Book)
    expect(book.id).to eq("Jumble")
    expect(book.title).to eq("Frogs, meet Clogs")
    expect(book.author).to eq(["Deannah"])
    expect(book.description).to eq("Not Much to say about it.")
  end

  it 'will replace an absent author with N/A' do
    data = {
            id: "Jumble",
            volumeInfo: {
                title: "Frogs, meet Clogs",
                authors: nil,
                description: "Not Much to say about it."}
        }
    book = Book.new(data)
    expect(book.author).to eq(["N/A"])
  end

  it 'will replace empty author array with N/A' do
    data = {
            id: "Jumble",
            volumeInfo: {
                title: "Frogs, meet Clogs",
                authors: [],
                description: "Not Much to say about it."}
        }
    book = Book.new(data)
    expect(book.author).to eq(["N/A"])
  end
end
