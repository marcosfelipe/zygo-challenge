require 'rails_helper'

RSpec.describe 'home', type: :feature, js: true do
  setup do
    @book = Book.create!(title: 'Test', description: 'test', 
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
  
  describe 'pagination' do
    before { FactoryBot.create_list(:book, 15) }
    
    scenario 'user can see the page with max of 10 books per page' do
      visit(root_path)
      expect(page).to have_content('Displaying Book 1 - 10 of 16 in total')
    end
    
    scenario 'user can go to page 2' do
      visit(root_path)
      find('a', text: '2').click
      expect(page).to have_content('Displaying Book 11 - 16 of 16 in total')
    end
  end
  
  describe 'filter' do
    scenario 'user can filter by title name' do
      book = FactoryBot.create(:book, :other_title)
      visit(root_path)
      fill_in :search, with: book.title
      click_on 'Filter'
      expect(page).to have_content(book.title)
      expect(page).to have_content('Displaying 1 Book')
    end
    
    scenario 'user can filter by author' do
      book = FactoryBot.create(:book)
      visit(root_path)
      fill_in :search, with: book.author
      click_on 'Filter'
      expect(page).to have_content(book.author)
      expect(page).to have_content('Displaying 1 Book')
    end
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

    scenario 'create returns invalid book' do
      click_on class: 'btn-floating'
      expect(page).to have_content('New Book')
      fill_in :book_description, with: ''
      click_on 'Save'
      expect(page).to have_content('Could not save the book')
    end
    
    scenario 'user can go to favorites page' do 
      click_on 'Favorites'
      expect(page).to have_current_path(favorite_books_path)
    end
    
    scenario 'user can edit a book' do
      click_on 'edit'
      expect(page).to have_content('Edit Book')
    end
    
    scenario 'user can update a book' do
      click_on 'edit'
      expect(page).to have_content('Edit Book')
      fill_in :book_title, with: 'new title'
      click_on 'Save'
      expect(page).to have_content('Book saved!')
    end

    scenario 'update returns invalid book' do
      click_on 'edit'
      expect(page).to have_content('Edit Book')
      fill_in :book_description, with: ''
      click_on 'Save'
      expect(page).to have_content('Could not save the book')
    end
    
    scenario 'user can favorite a book' do
      click_on 'favorite_border'
      expect(page).to have_link('favorite', class: 'btn-flat red-text')
    end
    
    scenario 'user can remove favorite book' do
      click_on 'favorite_border'
      expect(page).to have_link('favorite', class: 'btn-flat red-text')
      click_on 'favorite'
      expect(page).to have_link('favorite_border', class: 'btn-flat black-text')
    end
    
    scenario 'user can remove a book' do
      accept_confirm do
        click_on 'delete'
      end
      expect(page).to_not have_selector("#book_#{@book_id}")
      expect(page).to have_content('Book removed!')
    end
  end
end
