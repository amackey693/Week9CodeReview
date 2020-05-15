require 'pry'

class Word  
  attr_reader :id
  attr_accessor :word
  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes.fetch(:word).downcase
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

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def update(word)
    self.word = word
    @@words[self.id] = Word.new({:word => self.word, :id => self.id})
  end

  def self.find(id)
    @@words[id]
  end

  def delete()
    @@words.delete(self.id)
  end

  def self.search(search)
    search = search.downcase
    words = Word.all.map {|w| w.word }
    result = []
    all_words = words.grep(/#{search}/)
    all_words.each do |a| 
      match = Word.all.select {|w| w.word.include?(a)}
      result.concat(match)
    end
    result
  end

  def self.sort
    Word.all.sort_by{|w| w.word}
  end

  def get_definitions
    Def.find_by_word(self.id)
  end
end