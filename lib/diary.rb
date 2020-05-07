require 'pg'

class Diary

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      database_connection = PG.connect(dbname: 'diary_manager_test')
    else
      database_connection = PG.connect(dbname: 'diary_manager')
    end

    result = database_connection.exec('SELECT * FROM diary;')
    result.map { |entry| entry['entry'] }
  end
end
