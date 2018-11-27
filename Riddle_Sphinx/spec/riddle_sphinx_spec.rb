require('riddle_sphinx')
require('rspec')


describe(Sphinx) do
  describe('#riddle_picker') do
    it("outputs a riddle.") do
      new_riddler = Sphinx.new()
      expect(new_riddler.riddle_picker(0)).to(eq("What's in my pockets'es?"))
    end

  end
end
