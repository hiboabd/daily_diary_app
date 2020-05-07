require 'spec_helper'

feature 'Adding diary entry' do
  scenario 'User submits diary entry' do
    visit('/entries/new')
    fill_in('entry', with: 'This is my first entry.')
    click_button('Submit')

    expect(page).to have_content 'This is my first entry.'
  end
end
