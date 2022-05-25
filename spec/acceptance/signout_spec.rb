require 'rails_helper'

RSpec.describe 'sign out', type: :feature, js: true do
  scenario('user can sign out') do
    user = FactoryBot.create(:user)
    visit('/sign_in')
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_on 'Log in'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Signed in successfully')
    click_on 'sign out'
    expect(page).to have_content('Signed out successfully')
  end
end
