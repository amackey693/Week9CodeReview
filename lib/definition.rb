require 'pry'

class Def
  attr_reader :id, :timestamp
  attr_accessor :definition, :author, :word_id

  @@definitions = {}
  @@total_rows = 0 

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @author = attributes.fetch(:author)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
    @timestamp = Time.new()
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Def.new({:definition => self.definition, :author => self.author, :word_id => self.word_id, :id => self.id})
  end

  def ==(def_to_compare)
    (self.definition() == def_to_compare.definition()) && (self.word_id() == def_to_compare.word_id())
  end

  def self.clear 
    @@definitions = {}
    @@total_rows = 0
  end


  def update(definition, word_id)
    self.definition = definition
    self.word_id = word_id
    @@definitions[self.id] = Def.new({:definition => self.definition, :author => self.author, :word_id => self.word_id, :id => self.id})
  end

  def self.find(id)
    @@definitions[id] 
  end

  def delete()
    @@definitions.delete(self.id)
  end

  def self.sort
    Def.all.sort_by{|d| d.timestamp}
  end

  def self.find_by_word(word_id)
    definitions = []
    @@definitions.values.each do |d|
      if d.word_id == word_id
        definitions.push(d)
      end
    end
  end

  def get_words
    Word.find(self.word_id)
  end
end