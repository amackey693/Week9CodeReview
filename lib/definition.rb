require 'pry'
require 'word'

class Def
  attr_reader :id, :timestamp
  attr_accessor :definition, :author, :word_id

  @@definitions = {}
  @@total_rows = 0 

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @author = attributes.fetch(:author)
    @word_id = word_id
    @id = attributes.fetch(:id) || @@total_rows += 1
    @timestamp = Time.new()
  end
end