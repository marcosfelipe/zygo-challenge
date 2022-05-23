class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.save!
    respond_to do |format|
      format.html { redirect_to(root_path, notice: 'Book saved!') }
      format.turbo_stream { flash.now[:notice] = 'Book saved!' }
    end
  rescue ActiveRecord::RecordInvalid
    flash.now[:alert] = 'Could not save the book'
    render(:new, status: :unprocessable_entity)
  end
  
  private 
  
  def book_params
    params.require(:book).permit(:description, :title, :author, :picture)
  end
end
