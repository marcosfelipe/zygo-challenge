class FavoriteBooksController < ApplicationController
  before_action :load_book, only: %i[create destroy]
  
  def create
    current_user.books << book
  end
  
  def destroy
    current_user.books.destroy(book)
  end
  
  def index
    @books = current_user.books.paginate_search(params)
  end
  
  private 
  
  attr_reader :book
  
  def load_book
    @book = Book.find(params[:book_id])
  end
end
