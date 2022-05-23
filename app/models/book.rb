class Book < ApplicationRecord
  include Searchable
  validates_presence_of :title, :author, :description, :picture

  mount_uploader :picture, BookPictureUploader
end
