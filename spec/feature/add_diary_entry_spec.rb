require 'spec_helper'

feature 'Adding diary entry' do
  scenario 'User submits diary entry' do
    visit('/entries/new')
    fill_in('entry', with: 'This is my first entry.')
    fill_in('title', with: 'Entry #1')
    click_button('Submit')

    expect(page).to have_content 'Entry #1'
  end
end
