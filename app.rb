require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')

get('/') do
  @list = Word.all()
  erb(:list)
end

post('/') do
  name = params["name"]
  definition = params["definition"]
  word = Word.new(name, definition)
  word.save()
  # word.update()
  @list = Word.all()

  erb(:list)
end

get('/entry/:id') do
  @word = Word.find(params[:id])
  erb(:entry)
end

post('/entry/:name') do
  @word = Word.find(params[:name])
  Word.delete(@word.id)
  erb(:entry)
end

get('/definition/:id') do
  @word = Word.find(params[:id])
  erb(:definition)
end

post('/definition/:id') do
  name = params['name']
  definition = params['definition']
  word = Word.new(name, defintion)
  @word = Word.find(params[:id])
  # @word.update(name,definition)
  erb(:definition)
end
