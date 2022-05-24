require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'db columns' do
    it { should have_db_column(:email) }
    it { should have_db_column(:encrypted_password) }
  end

  describe 'relationships' do
    it { should have_many(:favorite_books) }
    it { should have_many(:books) }
  end

  describe '#favorite_book?' do
    before do 
      @user = FactoryBot.create(:user)
      @book = FactoryBot.create(:book)
    end
    
    it 'should return that book is not a favorite one' do
      expect(@user.favorite_book?(@book)).to be_falsey
    end
    
    it 'should return that book is a favorite one' do
      @user.books << @book
      expect(@user.favorite_book?(@book)).to be_truthy
    end
  end
end
