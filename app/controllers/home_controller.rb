class HomeController < ApplicationController
  def index
    @books = Book.all
    respond_to(:html)
  end
end
