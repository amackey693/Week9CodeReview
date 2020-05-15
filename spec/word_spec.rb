require 'rspec'
require 'word'
require 'pry'


describe '#Word' do
  
  before(:each) do
    Word.clear()
    Def.clear()
    @word = Word.new({:word => "Cat", :id => nil})
    @word.save()
    @word1 = Word.new({:word => "Color", :id => nil})
    @word1.save()
    @def = Def.new({ :definition =>"a definition here", :author => "johnny ", :id => nil, :word_id => @word.id})
    @def.save()
  end
 
  describe('#initialize') do
    it('creates a hash with attributes') do
      word1 = Word.new({:word => "Cat", :id => nil})
      expect(word1.word).to(eq("cat"))
    end  
  end

  describe('.all') do 
    it("is empty at first") do
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do 
    it("saves a word") do
      Word.clear()
      word1 = Word.new({:word => "Cat", :id => nil})
      word1.save()
      expect(Word.all()).to(eq([word1]))
    end
  end

  describe('#==')do
    it("is the same word if it has the same attributes as another word")do
      word1 = Word.new({:word => "Cat", :id => nil})
      word2 = Word.new({:word => "Cat", :id => nil})
      expect(word1).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('#update') do
    it("updates a word by id") do
     @word.update("Bird")
     expect(@word.word).to(eq("Bird"))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      expect(Word.find(@word1.id)).to(eq(@word1))
    end
  end
  
  describe('#delete') do 
    it("deletes a word") do 
     @word.delete()
     expect(Word.all).to(eq([@word1]))
    end
  end

  describe('.search') do 
    it("searches through all words and returns the words that match search term") do 
    expect(Word.search("C")).to(eq([@word, @word1]))
    end
  end
  
  describe('#sort')do
    it("sorts words alphebetically")do
      expect(Word.sort()).to(eq([@word, @word1]))
    end
  end

  describe('#definitions')do
    it("finds the definition that belongs to the word")do
      expect(@word.definitions()).to(eq([@def]))
    end
  end
  
end





# EXAMPLES FOR TESTING 
# describe '#Class' do
#   before(:each) do
#     Class.clear()
#     @class_variable = Class.new()
#     @class_variable.save()
#   end

#   describe('method') do
#     it("describe test here") do
#       expect(method).to(eq(something))
#     end
#   end
# end