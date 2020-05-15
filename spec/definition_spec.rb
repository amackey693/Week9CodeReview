require 'rspec'
require 'definition'
require 'pry'

describe '#Def' do
  describe('#initialize')do
    it('creates a hash with attributes')do
      def1 = Def.new({ :definition =>"a definition here", :author => "johnny ", :id => nil })
      expect(def1.definition).to(eq("a definition here"))
    end
  end
end