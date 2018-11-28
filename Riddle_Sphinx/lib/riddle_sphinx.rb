require('pry')

class Sphinx

  def initialize()
    @questions =
    [["What's in my pockets'es?", "Nothing"],
    ["How long is a piece of string?", "Long enough"],
    ["I have no wings, yet I do fly; <br>I have no eyes, yet I do cry;<br>Sometimes low, but always high;<br>If I get too heavy, I'll drop by.<br>What am I?", "A cloud"]]
  end


  def random_riddle_picker
    rand(0..@questions.length-1)
  end

  def riddle_selector(number)
    (@questions[number])[0]
  end

  def valid_answer?(answer_text, question_array_position)
    if ((@questions[question_array_position])[1] == answer_text)
      return true
    else
      return false
    end
  end

end
