require 'diary'

describe Diary do
  describe '.all' do
    it 'returns all entries' do
      connection = PG.connect(dbname: 'diary_manager_test')

      Diary.add(entry: 'This is my first entry')
      Diary.add(entry: 'This is my second entry')
      Diary.add(entry: 'This is my third entry')

      diary_entries = Diary.all

      expect(diary_entries).to include("This is my first entry")
      expect(diary_entries).to include("This is my second entry")
      expect(diary_entries).to include("This is my third entry")
    end
  end

  describe '.add' do
    it 'adds a new diary entry' do
      Diary.add(entry: 'This is my first entry')

      expect(Diary.all).to include 'This is my first entry'
    end
  end
end
