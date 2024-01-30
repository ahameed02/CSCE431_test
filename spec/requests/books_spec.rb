require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "POST /books" do
    context "with valid parameters" do
      it "creates a new Book and redirects to the Book's page with a notice" do
        expect {
          post books_path, params: { book: { title: 'New Book' } }
        }.to change(Book, :count).by(1)

        follow_redirect!
        expect(response.body).to include('Book was successfully created.')
        expect(response.body).to include('New Book')
      end
    end

    context "with invalid parameters" do
        it "does not create a book and re-renders the new template with a notice" do
          expect {
            post books_path, params: { book: { title: '' } }
          }.to_not change(Book, :count)
  
          expect(response.body).to include('prohibited this book from being saved')
        end
      end
    end
  end