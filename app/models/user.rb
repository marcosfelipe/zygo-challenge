class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :favorite_books
  has_many :books, through: :favorite_books
  
  def favorite_book?(book)
    books.include?(book)
  end
end
