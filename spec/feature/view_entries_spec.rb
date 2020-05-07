require 'spec_helper'

feature 'Viewing entries' do
  scenario 'viewing all diary entries' do
    visit('/entries')


    expect(page).to have_content "This is the first entry."
    expect(page).to have_content "This is the second entry."
    expect(page).to have_content "This is the third entry."
  end
end
