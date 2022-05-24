require 'rails_helper'

RSpec.describe 'login', type: :feature, js: true do
  scenario('login page') do
    visit('/sign_in')
    expect(page).to have_content('Log in')
  end
  
  scenario('valid credentials') do
    user = FactoryBot.create(:user)
    visit('/sign_in')
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_on 'Log in'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Signed in successfully')
  end
  
  scenario('invalid credentials') do
    visit('/sign_in')
    fill_in :user_email, with: 'not@user.com'
    fill_in :user_password, with: 'notuser'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end
end
