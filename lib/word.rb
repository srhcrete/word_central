class Word
  @@list = []
  attr_reader :id
  attr_accessor :name, :definition

  def initialize(name, definition)
    @name = name
    @definition = definition
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

  def self.delete(del_id)
   @@list.map do |word|
     if word.id == del_id
     @@list.delete(word)
     end
   end
 end
end
  # def self.all
  #   @@list
  # end
  #
  # def save
  #   if @@list.all? do |word| #
  #     word.name != self.name and self.definition != "" and self.name != ""
  #   end
  #     @@list.push(self)
  #   end
  # end

  # def update
  #   @@list.each do |word|
  #     if word.name == self.name
  #       word.definition.push(self.definition)
  #     end
  #   end
  # end
