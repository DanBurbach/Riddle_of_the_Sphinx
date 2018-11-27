require('riddle_sphinx')
require('rspec')


describe(Sphinx) do
  describe('#riddle_picker') do
    it("outputs a riddle.") do
      new_riddler = Sphinx.new()
      expect(new_riddler.riddle_picker()).to(eq("What's in my pockets'es?"))
    end
  end
  describe('#valid_answer?') do
    it("checks if a riddle answer is correct.") do
      new_riddler = Sphinx.new()
      expect(new_riddler.valid_answer?("Nothing",0)).to(eq(true))
    end
  end
end
