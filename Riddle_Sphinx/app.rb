require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/riddle_sphinx')
require('pry')



get ('/') do

    new_riddler = Sphinx.new
    # riddle_number = new_riddler.random_riddle_picker()
    riddle_number = 0
    @question = new_riddler.riddle_selector(riddle_number)
    @secret = riddle_number
  erb(:input)
end

post ('/question2') do
    new_riddler = Sphinx.new
    riddle_number = 1
    @question = new_riddler.riddle_selector(riddle_number)
    @secret = riddle_number
  erb(:question2)
end

post ('/question3') do
    new_riddler = Sphinx.new
    riddle_number = 2
    @question = new_riddler.riddle_selector(riddle_number)
    @secret = riddle_number
  erb(:question3)
end

post ('/output') do
  new_riddler = Sphinx.new
  @first_question = params.fetch("answer")
  answer_index = params.fetch('secret').to_i
  answer_attempt = params.fetch('answer')

  if(new_riddler.valid_answer?(answer_attempt, 0) == true)
    new_riddler = Sphinx.new
    riddle_number = 1
    @question = new_riddler.riddle_selector(riddle_number)
    @secret = riddle_number
    erb(:question2)
  elsif (new_riddler.valid_answer?(answer_attempt, 1) == true)
    new_riddler = Sphinx.new
    riddle_number = 2
    @question = new_riddler.riddle_selector(riddle_number)
    @secret = riddle_number
    erb(:question3)
  elsif (new_riddler.valid_answer?(answer_attempt, 2) == true)
    erb(:win)
  else
    erb(:fail)
  end

end
