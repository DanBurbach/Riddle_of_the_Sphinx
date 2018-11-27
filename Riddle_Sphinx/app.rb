require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/riddle_sphinx')
require('pry')



get ('/') do

  if(File.read("public/riddle_number_temp") == "")
    new_riddler = Sphinx.new
    riddle_number = new_riddler.random_riddle_picker()
    new_riddler.temp_file_writer(riddle_number)
    @question = new_riddler.riddle_selector(riddle_number)
  else
    answer = params.fetch('answer')
    new_riddler = Sphinx.new
    riddle_number = new_riddler.temp_file_reader()

      if(new_riddler.valid_answer?(answer, riddle_number))
        @test_answer = "YOu did it"
      end
    @question = new_riddler.riddle_selector(riddle_number)
  end


  erb(:input)
end

# post ('/') do
#   new_riddler = Sphinx.new
#   riddle_number = new_riddler.temp_file_reader()
#   @question = new_riddler.riddle_selector(riddle_number)
#   erb(:input)
# end

post ('/output') do
  @question = params.fetch('secret')
  @first_question = params.fetch("first_question")

  erb(:output)
end
