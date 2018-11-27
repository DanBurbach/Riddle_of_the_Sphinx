require('pry')

class Sphinx

  attr_accessor(:answers)
  attr_reader(:questions)

  def initialize()
    @correct_answers = 0
    @answers = []
    @questions = [["What's in my pockets'es?", "Nothing"], ["How long is a piece of string?", "Long enough"]]

  end


  def riddle_picker(number)
    (@questions[number])[0]
  end








end
