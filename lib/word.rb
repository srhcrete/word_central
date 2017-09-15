class Word
  @@list = []
  attr_reader(:name, :defintion, :id)

  def initialize(attributes)
    @word = attributes.fetch(:name)
    @definition = attributes.fetch(:definition)
    @defs = []
    @id = @@list.length + 1
    # def add(@definition)
    #   @defs.push(@definition)
    # end
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
    @@list.push(self)
  end

  def update
    @@list.each do |word|
      if word.name == self.name
        @definitions.push(self.definitions)
      end
    end
  end

  def self.clear
    @@list = []
  end

end
