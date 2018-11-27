require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/riddle_sphinx')
require('pry')


get ('/') do
  new_riddler = Sphinx.new



  erb(:input)
end

get ('/output') do
  @first_question = params.fetch("first_question")
  erb(:output)
end
