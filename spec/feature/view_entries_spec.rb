require 'spec_helper'

feature 'Viewing entries' do
  scenario 'viewing all diary entries' do
    connection = PG.connect(dbname: 'diary_manager_test')

    connection.exec("INSERT INTO diary (entry) VALUES('This is my first entry');")
    connection.exec("INSERT INTO diary (entry) VALUES('This is my second entry');")
    connection.exec("INSERT INTO diary (entry) VALUES('This is my third entry');")

    visit('/entries')


    expect(page).to have_content "This is my first entry"
    expect(page).to have_content "This is my second entry"
    expect(page).to have_content "This is my third entry"
  end
end
