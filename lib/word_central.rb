class Word
  @@list = []
  attr_reader :id
  attr_accessor :word, :definitions

  def initialize(word, definitions)
    @word = word
    @definitions = definitions
    @id = @@list.length + 1
  end

  def self.sort
    @@list.sort_by! {|item| item.id}
  end

  def self.find(id) #class methods
    @@list[id - 1]
  end

  def self.all
    @@list
  end

  def save # justt method :)
    if @@list.all? do |item| #
      item.name != self.name
    end
      @@list.push(self)
    end
  end

  def update
    @@list.each do |item|
      if item.name == self.name
        item.definitions = self.definitions
      end
    end
  end

  def self.clear
    @@list = []
  end

end
