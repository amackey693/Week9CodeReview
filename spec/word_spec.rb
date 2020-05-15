require 'rspec'
require 'word'
require 'pry'


describe '#Word' do
 describe('#initialize') do
    it('creates a hash with attributes') do
      word1 = Word.new({:word => "Cat", :id => nil})
      expect(word1.word).to(eq("Cat"))
    end  
  end

  describe('.all') do 
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do 
    it("saves a word") do
      word1 = Word.new({:word => "Cat", :id => nil})
      word1.save()
      expect(Word.all()).to(eq([word1]))
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