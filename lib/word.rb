require 'pry'

class Word  
  attr_reader :id
  attr_accessor :word
  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save 
    @@words[self.id] = Word.new({:word => self.word, :id => self.id})
  end

  def ==(word_to_compare)
    self.word() == word_to_compare.word()
  end
end