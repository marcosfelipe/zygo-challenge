class Book < ApplicationRecord
  include Searchable
  validates_presence_of :title, :author, :description, :picture

  mount_uploader :picture, BookPictureUploader
  
  def self.paginate_search(params = {}) 
    direction = params[:sort] || :desc
    search(params[:search]).paginate(page: params[:page]).order(title: direction)
  end
end
