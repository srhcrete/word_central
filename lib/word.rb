class Word
  @@list = []
  attr_reader :id
  attr_accessor :name, :definitions

  def initialize(name, definition)
    @name = name
    @definitions = [definition]
    @id = @@list.length + 1
  end

  def self.all()
   @@list
  end

  def self.clear
    @@list = []
  end

  def save()
    @@list.push(self)
  end

  def self.find(id)
    word_id = id.to_i()
    @@list.each do |word|
      if word.id == word_id
        return word
      end
    end
  end

 def add_definition(definition)
   @definitions.push(definition)
 end

 def self.list
   @definitions
 end
end
