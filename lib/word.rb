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
end