class Book < ApplicationRecord
  include Searchable
  validates_presence_of :title, :author, :description, :picture

  mount_uploader :picture, BookPictureUploader
  
  scope :paginate_search, -> (params = {}) { search(params[:search]).paginate(page: params[:page]) }
end
