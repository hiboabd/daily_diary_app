require 'diary'
require 'database_helpers'

describe Diary do
  describe '.all' do
    it 'returns all entry titles' do
      connection = PG.connect(dbname: 'diary_manager_test')

      diary = Diary.add(entry: 'This is my first entry', title: 'Entry #1')
      Diary.add(entry: 'This is my second entry', title: 'Entry #2')
      Diary.add(entry: 'This is my third entry', title: 'Entry #3')

      diary_entries = Diary.all
      p diary_entries.first
      p diary

      expect(diary_entries.length).to eq 3
      expect(diary_entries.first).to be_a Diary
      expect(diary_entries.first.id).to eq diary.id
      expect(diary_entries.first.title).to eq 'Entry #1'
      expect(diary_entries.first.entry).to eq 'This is my first entry'
    end
  end

  describe '.add' do
    it 'adds a new diary entry and title' do
      entry = Diary.add(entry: 'This is my first entry', title: 'Entry #1')

      persisted_data = persisted_data(id: entry.id)

      expect(entry).to be_a Diary
      expect(entry.id).to eq persisted_data.first['id']
      expect(entry.title).to eq 'Entry #1'
      expect(entry.entry).to eq 'This is my first entry'
    end
  end
end
