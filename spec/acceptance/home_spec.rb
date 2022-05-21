require 'rails_helper'

RSpec.describe 'home', type: :feature do
  scenario('home page') do
    visit(root_path)
    expect(page).to have_content('Home')
  end
end
