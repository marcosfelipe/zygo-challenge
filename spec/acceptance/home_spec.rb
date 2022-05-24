require 'rails_helper'

RSpec.describe 'home', type: :feature, js: true do
  setup do
    Book.create!(title: 'Test', description: 'test', 
                 picture: fixture_file_upload('dummy.png'), 
                 author: 'test')
  end
  
  scenario('home page') do
    visit(root_path)
    expect(page).to have_content('Home')
  end
  
  scenario 'anonymous user visualizes the book list' do
    visit(root_path)
    expect(page).to have_content('Test')
  end
  
  context 'logged user' do
    before do
      user = FactoryBot.create(:user)
      visit '/sign_in'
      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password
      click_on 'Log in'
      expect(page).to have_current_path(root_path)
    end

    scenario 'logged user can open the new book form' do
      expect(page).to have_content('sign out')
      click_on class: 'btn-floating'
      expect(page).to have_content('New Book')
    end

    scenario 'logged user can create a book' do
      click_on class: 'btn-floating'
      expect(page).to have_content('New Book')
      fill_in :book_description, with: 'test'
      fill_in :book_author, with: 'test'
      fill_in :book_title, with: 'test'
      attach_file 'book[picture]', Rails.root.join('spec', 'fixtures', 'files', 'dummy.png'), make_visible: true
      click_on 'Save'
      expect(page).to have_content('Book saved!')
    end
  end
  
  # TODO: add test for edit/update
  # TODO: favorite books
end
