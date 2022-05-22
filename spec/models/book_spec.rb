require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'db columns' do
    it { should have_db_column(:title) }
    it { should have_db_column(:description) }
    it { should have_db_column(:picture) }
    it { should have_db_column(:author) }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:picture) }
    it { should validate_presence_of(:author) }
  end  
end
