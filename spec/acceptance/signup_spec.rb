require 'rails_helper'

RSpec.describe 'sign up', type: :feature, js: true do
  scenario('sign up page') do
    visit('/sign_up')
    expect(page).to have_content('Sign up')
  end

  scenario('create a valid user') do
    visit('/sign_up')
    fill_in :user_email, with: 'new@user.com'
    fill_in :user_password, with: 'test123'
    fill_in :user_password_confirmation, with: 'test123'
    click_on 'Sign up'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario('invalid new user') do
    visit('/sign_up')
    fill_in :user_email, with: 'invalid@user.com'
    fill_in :user_password, with: 'test123'
    fill_in :user_password_confirmation, with: 'test1234'
    click_on 'Sign up'
    expect(page).to have_content("doesn't match Password")
  end
end
