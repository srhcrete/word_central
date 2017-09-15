require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')

get('/') do
  @list = Word.all()

  erb(:list)
end

post('/') do
  word = params["word"]
  definition = params["definition"]
  word = Word.new(word, definition)
  word.save()
  word.update()
  @list = Word.sort()


  erb(:list)
end
