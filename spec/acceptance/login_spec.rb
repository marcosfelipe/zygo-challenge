require 'rails_helper'

RSpec.describe 'login', type: :feature do
  scenario('login page') do
    visit('/sign_in')
    expect(page).to have_content('Log in')
  end
end
