require 'rails_helper'

RSpec.describe Book, type: :model do
    it 'is valid with a valid title, author, price, and published date' do
      book = Book.new(title: 'Valid Title', author: 'Author Name', price: 19, published_date: Date.today)
      expect(book).to be_valid
    end

  it 'is invalid without a title' do
    book = Book.new(title: nil)
    expect(book).to_not be_valid
  end
end