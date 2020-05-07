require 'diary'

describe Diary do
  describe '.all' do
    it 'returns all entries' do
      connection = PG.connect(dbname: 'diary_manager_test')

      connection.exec("INSERT INTO diary (entry) VALUES('This is my first entry');")
      connection.exec("INSERT INTO diary (entry) VALUES('This is my second entry');")
      connection.exec("INSERT INTO diary (entry) VALUES('This is my third entry');")

      diary_entries = Diary.all

      expect(diary_entries).to include("This is my first entry")
      expect(diary_entries).to include("This is my second entry")
      expect(diary_entries).to include("This is my third entry")
    end
  end
end
