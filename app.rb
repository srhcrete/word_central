require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')


get('/') do
  @words = Word.sort
  erb(:input)
end


get('/output/:name') do
  @word = Word.find(params[:name])
  erb(:output)
end

post('/output') do
  @word = Word.new({:name=>params['name'],:definition=>params['definition']})
  @word.save
  @words = Word.sort
  erb(:input)
end
