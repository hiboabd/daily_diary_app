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

  def self.add(entry:)
    if ENV['ENVIRONMENT'] = 'test'
      database_connection = PG.connect(dbname: 'diary_manager_test')
    else
      database_connection = PG.connect(dbname: 'diary_manager')
    end

    database_connection.exec("INSERT INTO diary (entry) VALUES('#{entry}')")
  end
end
