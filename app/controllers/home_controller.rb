class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 1)
  end
end
