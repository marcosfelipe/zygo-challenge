require 'rails_helper'

RSpec.describe 'home', type: :feature do
  setup do
    Book.create!(title: 'Test', description: 'test', picture: 'test', author: 'test')
  end
  
  scenario('home page') do
    visit(root_path)
    expect(page).to have_content('Home')
  end
  
  scenario 'anonymous user visualizes the book list' do
    visit(root_path)
    expect(page).to have_content('Title: Test')
  end
end
