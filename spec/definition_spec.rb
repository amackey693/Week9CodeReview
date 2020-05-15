require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Def' do

  before(:each) do
    Word.clear()
    Def.clear()
    @word = Word.new({:word => "Cat", :id => nil})
    @word.save()
    @def = Def.new({ :definition =>"a definition here", :author => "johnny ", :id => nil })
    @def.save()
  end

  describe('#initialize')do
    it('creates a hash with attributes')do
      def1 = Def.new({ :definition =>"a definition here", :author => "johnny ", :id => nil })
      expect(def1.definition).to(eq("a definition here"))
    end
  end

  describe('.all') do 
    it("is empty at first") do
      Def.clear()
      expect(Def.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition")do
     Def.clear()
     def1 = Def.new({ :definition =>"a definition here", :author => "johnny ", :id => nil })
     def1.save()
     expect(Def.all).to(eq([def1]))
    end
  end

  describe('#==')do
    it('is the same definition if it has the same attributes as another definition')do
      def1 = Def.new({ :definition =>"a definition here", :author => "johnny ", :id => nil })
      def1.save()
      def2 = Def.new({ :definition =>"a definition here", :author => "johnny ", :id => nil })
      def2.save()
      expect(def1).to(eq(def2))
    end
  end

  describe('.clear')do
    it("clears all definitions")do
      Def.clear()
      expect(Def.all).to(eq([]))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
     @def.update("Bird")
     expect(@def.definition).to(eq("Bird"))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      expect(Def.find(@def.id)).to(eq(@def))
    end
  end


  describe('#delete') do
    it("deletes a definition") do
      @def.delete()
      expect(Def.all()).to(eq([]))
    end
  end

  # can't test accordingly because all items are created at the same time. 
  describe('#sort') do
    it("sorts definitions by timestamp")do
      expect(Def.sort()).to(eq(@def))
    end
  end




end