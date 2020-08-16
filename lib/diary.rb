require 'pg'

class Diary

  attr_reader :id, :entry, :title

  def initialize(id:, entry:, title:)
    @id  = id
    @entry = entry
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      database_connection = PG.connect(dbname: 'diary_manager_test')
    else
      database_connection = PG.connect(dbname: 'diary_manager')
    end

    result = database_connection.exec('SELECT * FROM diary;')
    result.map do |entry|
      Diary.new(id: entry['id'], entry: entry['entry'], title: entry['title'])
    end
  end

  def self.add(entry:, title:)
    if ENV['ENVIRONMENT'] = 'test'
      database_connection = PG.connect(dbname: 'diary_manager_test')
    else
      database_connection = PG.connect(dbname: 'diary_manager')
    end

    result = database_connection.exec("INSERT INTO diary (entry, title) VALUES('#{entry}', '#{title}') RETURNING id, entry, title")
    Diary.new(id: result[0]['id'], entry: result[0]['entry'], title: result[0]['title'])
  end
end
