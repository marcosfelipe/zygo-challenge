class BooksController < ApplicationController
  before_action :load_book, only: %i[edit update destroy]
  
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
  
  def edit
  end

  def update
    @book.update!(book_params)
    flash.now[:notice] = 'Book saved!'
  rescue ActiveRecord::RecordInvalid
    flash.now[:alert] = 'Could not save the book'
    render(:edit, status: :unprocessable_entity)
  end
  
  def destroy
    @book.destroy!
    flash.now[:notice] = 'Book removed!'
  end
  
  private 
  
  def book_params
    params.require(:book).permit(:description, :title, :author, :picture)
  end
  
  def load_book
    @book = Book.find(params[:id])
  end
end
