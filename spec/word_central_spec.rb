require('rspec')
require('word')
require('pry')

describe('Word') do
  before() do
    Word.clear()
  end

  describe('lists words in dictionary') do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a word to the dictionary list') do
      word = Word.new('fragment','a small part broken off something')
      word.save()
      expect(Word.all()).to(eq([word]))
    end
  end

  describe('.clear') do
    it('clears all words from the dictionary list') do
      word = Word.new('fragment','a small part broken off something')
      word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('finds an word by its id') do
      word1 = Word.new('fragment','a small part broken off something')
      word1.save()
      word2 = Word.new('chasm','a deep fissure in the earth, rock, or another surface')
      word2.save()
      expect(Word.find(1)).to(eq(word1))
      expect(Word.find(2)).to(eq(word2))
    end
  end
end
