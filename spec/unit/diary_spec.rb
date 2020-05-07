require 'diary'

describe Diary do
  describe '.all' do
    it 'returns all entries' do
      diary_entries = Diary.all

      expect(diary_entries).to include("This is the first entry.")
      expect(diary_entries).to include("This is the second entry.")
      expect(diary_entries).to include("This is the third entry.")
    end
  end
end
