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
end

post('/home/:id/definition') do
  @word = Word.find(params[:id].to_i())
  define = params[:define]
  author = params[:author]
  new_definition = Def.new({:definition => define, :author => author, :word_id => nil, :id => nil})
  new_definition.save()
  erb(:view)
end

#for editing/deleting a definition
get('/edit/:id') do
  @def = Def.find(params[:id].to_i())
  erb(:edit)
end

patch('/home/:id') do
  @def = Def.find(params[:id].to_i())
  @def = Def.all
  @def.update(params[:redefine])
  erb(:edit)
end

delete('/home/:id') do
  @def = Def.find(params[:id].to_i())
  @def.delete()
  erb(:home)
end


# make an admin only routing page for delete/renaming!
# get('/home/word/edit/:id') do
#   @word = Word.find(params[:id].to_i())
#   erb(:admin_edit_word)
# end

# get('/home/view/:id') do
#   @word = Word.find(params[:id].to_i())
#   erb(:view)
# end


# patch('/home/:id') do
#   @word = Word.find(params[:id].to_i())
#   @words = Word.all
#   @word.update(params[:rename])
#   redirect to('/home')
# end

# delete('/home/:id') do
#   @word = Word.find(params[:id].to_i())
#   @word.delete()
#   redirect to('/home')
# end



