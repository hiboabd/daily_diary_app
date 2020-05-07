require 'pg'

def setup_test_database
  p "Connecting to test database..."

  connection = PG.connect(dbname: 'diary_manager_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE diary;")
end 
