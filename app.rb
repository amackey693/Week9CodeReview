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

get('/home/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:view)
end

post('/home/:id/definition') do
  @word = Word.find(params[:id].to_i())
  define = params[:define]
  author = params[:author]
  new_definition = Def.new({:definition => define, :author => author, :word_id => @word.id, :id => nil})
  new_definition.save()
  erb(:view)
end

#for editing/deleting a definition
get('/home/:id/definitions/:def_id') do
  @word = Word.find(params[:id].to_i())
  @def = Def.find(params[:def_id].to_i())
  erb(:edit_def)
end

patch('/home/:id/definitions/:def_id') do
  @word = Word.find(params[:id].to_i())
  @def = Def.find(params[:def_id].to_i())
  @def.update(params[:redefine])
  erb(:view)
end

delete('/home/:id/definitions/:def_id') do
  @word = Word.find(params[:id].to_i())
  @def = Def.find(params[:def_id].to_i())
  @def.delete
  erb(:view)
end


# make an admin only routing page for delete/renaming!
# get('/home/edit/:id') do
#   @word = Word.find(params[:id].to_i())
#   erb(:edit_word)
# end


# patch('/home/:id') do
#   @word = Word.find(params[:id].to_i())
#   @words = Word.all
#   @word.update(params[:rename], @board.id)
#   redirect to('/home')
# end

# delete('/home/:id') do
#   @word = Word.find(params[:id].to_i())
#   @word.delete()
#   redirect to('/home')
# end



