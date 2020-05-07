require 'spec_helper'

feature 'Viewing entries' do
  scenario 'viewing all diary entries' do
    connection = PG.connect(dbname: 'diary_manager_test')

    Diary.add(entry: 'This is my first entry', title: 'Entry #1')
    Diary.add(entry: 'This is my second entry', title: 'Entry #2')
    Diary.add(entry: 'This is my third entry', title: 'Entry #3')

    visit('/entries')

    expect(page).to have_content 'Entry #1'
    expect(page).to have_content 'Entry #2'
    expect(page).to have_content 'Entry #3'
  end
end
