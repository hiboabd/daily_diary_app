require 'spec_helper'

feature 'Adding diary entry' do
  scenario 'User submits diary entry' do
    visit('/')
    fill_in('entry', with: 'This is my first entry.')
    click_button('Submit')
  
    expect(page).to have_content 'You have submitted your entry.'
  end
end