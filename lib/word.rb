class Word
  @@list = []
  attr_reader :id
  attr_accessor :name, :definition

  def initialize(name, definition)
    @name = name
    @definition = definition
    @id = @@list.length + 1
  end

  def self.sort
    @@list.sort_by! {|word| word.name}
  end


  def self.find(id)
    @@list[id - 1]
  end

  def self.all
    @@list
  end

  def save
    if @@list.all? do |word| #
      word.name != self.name and self.definition != "" and self.name != ""
    end
      @@list.push(self)
    end
  end

  def update
    @@list.each do |word|
      if word.name == self.name
        word.definition = self.definition
      end
    end
  end

  def self.clear
    @@list = []
  end

end
