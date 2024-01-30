require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is valid with a valid title' do
    book = Book.new(title: 'Valid Title')
    expect(book).to be_valid
  end

  it 'is invalid without a title' do
    book = Book.new(title: nil)
    expect(book).to_not be_valid
  end
end