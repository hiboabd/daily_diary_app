require 'diary'

describe Diary do
  describe '.all' do
    it 'returns all entry titles' do
      connection = PG.connect(dbname: 'diary_manager_test')

      Diary.add(entry: 'This is my first entry', title: 'Entry #1')
      Diary.add(entry: 'This is my second entry', title: 'Entry #2')
      Diary.add(entry: 'This is my third entry', title: 'Entry #3')

      diary_entries = Diary.all

      expect(diary_entries).to include("Entry #1")
      expect(diary_entries).to include("Entry #2")
      expect(diary_entries).to include("Entry #3")
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
