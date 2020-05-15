require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.sort
  erb(:home)
end

get('/home') do
  @words = Word.sort
  erb(:home)
end

get('/home/new') do
 erb(:new_word) 
end

post('/home/new') do
  new_word = params[:new_word]
  word = Word.new({:word => new_word, :id => nil})
  word.save()
  redirect to('/home')
end

# make an admin only routing page for delete/renaming!
get('/home/edit/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:admin_edit_word)
end

get('/home/view/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:view)
end

get('/home/:id') do
  @word = Word.find(params[:id].to_i())
end

patch('/home/:id') do
  @word = Word.find(params[:id].to_i())
  @words = Word.all
  @word.update(params[:rename])
  redirect to('/home')
end

delete('/home/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/home')
end

#definitions routing
get('/home/:id/definition') do
  @word = Word.find(params[:id].to_i())
  erb(:view)
end

post('/home/:id/definition') do
  @word = Word.find(params[:id].to_i())
  definition = params[:definition]
  author = params[:author]
  new_definition = Def.new({:definition => definition, :author => author, :word_id => @word.id, :id => nil})
  new_definition.save()
  redirect to('/home/view/:id')
end
