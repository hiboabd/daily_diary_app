require 'diary'

describe Diary do
  describe '.all' do
    it 'returns all entries' do
      connection = PG.connect(dbname: 'diary_manager_test')

      Diary.add(entry: 'This is my first entry', title: 'Entry #1')
      Diary.add(entry: 'This is my second entry', title: 'Entry #2')
      Diary.add(entry: 'This is my third entry', title: 'Entry #3')

      diary_entries = Diary.all

      expect(diary_entries).to include("This is my first entry")
      expect(diary_entries).to include("This is my second entry")
      expect(diary_entries).to include("This is my third entry")
    end
  end

  describe '.add' do
    it 'adds a new diary entry and title' do
      entry = Diary.add(entry: 'This is my first entry', title: 'Entry #1').first

      expect(entry['entry']).to include 'This is my first entry'
      expect(entry['title']).to include 'Entry #1'
    end
  end
end
