require 'rails_helper'

RSpec.describe FavoriteBook, type: :model do
  describe 'db columns' do
    it { should have_db_column(:user_id) }
    it { should have_db_column(:book_id) }
  end
  
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:book) }
    it { should validate_uniqueness_of(:book_id).scoped_to(:user_id) }
  end
end
