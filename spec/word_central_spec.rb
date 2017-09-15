require('rspec')
require('word')
require('pry')

describe ('Word') do
  before() do
    Word.clear()
  end
  describe ('.all') do
    it ('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe ('.clear') do
    it ('clears all items from the list') do
      word = Word.new('fragment', ['a small part broken or seperated off something'])
      word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe ('.find') do
    it ('finds an word based on its id') do
      word = Word.new('fragment', ['a small part broken or seperated off something'])
      word.save()
      word2 = Word.new('chasm', ['a deep fissure in the earth, rock, or another surface'])
      word2.save()
      expect(Word.find(1)).to(eq(word))
      expect(Word.find(2)).to(eq(word2))
    end
  end
end
