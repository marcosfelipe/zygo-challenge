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
  
  scenario 'logged user can open the new book form' do
    user = FactoryBot.create(:user)
    visit '/sign_in'
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_on 'Log in'
    visit(root_path)
    expect(page).to have_content('sign out')
    click_on class: 'btn-floating'
    expect(page).to have_content('New Book')
  end
end
