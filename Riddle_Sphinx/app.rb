require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/riddle_sphinx')
require('pry')



get ('/') do
    @change_view = "/question2"
    @byline = "Solve the riddle to win a prize!!!!!!"
    new_riddler = Sphinx.new
    riddle_number = 0
    @heading = "Welcome to the Legend of the Sphinx!"
    @question = new_riddler.riddle_selector(riddle_number)
    @secret = riddle_number
  erb(:input)
end

post ('/question2') do
    new_riddler = Sphinx.new
    @answer = params.fetch("answer")
    answer_index = params.fetch('secret').to_i
    answer_attempt = params.fetch('answer')
    if(new_riddler.valid_answer?(answer_attempt, 0) == true)
      @change_view = "/question3"
      @question = new_riddler.riddle_selector(1)
      erb(:question2)
    else
      erb(:fail)
    end
end

post ('/question3') do
    new_riddler = Sphinx.new
    @answer = params.fetch("answer")
    answer_index = params.fetch('secret').to_i
    answer_attempt = params.fetch('answer')
    if(new_riddler.valid_answer?(answer_attempt, 1) == true)
      @change_view = "/win"
      @question = new_riddler.riddle_selector(2)
      erb(:question2)
    else
      erb(:fail)
    end
end

post ('/win') do
  new_riddler = Sphinx.new
  @answer = params.fetch("answer")
  answer_index = params.fetch('secret').to_i
  answer_attempt = params.fetch('answer')
  if(new_riddler.valid_answer?(answer_attempt, 2) == true)
    @byline = "(the prize was self respect all along)"
    erb(:win)
  else
    erb(:fail)
  end
end
