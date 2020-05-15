require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Def' do
  describe('#initialize')do
    it('creates a hash with attributes')do
      def1 = Def.new({ :definition =>"a definition here", :author => "johnny ", :id => nil })
      expect(def1.definition).to(eq("a definition here"))
    end
  end

  describe('.all') do 
    it("is empty at first") do
      expect(Def.all()).to(eq([]))
    end
  end

  decribe('#save') do
    it("saves a definition")do
     def1 = Def.new({ :definition =>"a definition here", :author => "johnny ", :id => nil })
     def1.save()
     expect(Def.all).to(eq([def1]))
    end
  end


end