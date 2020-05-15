require('sinatra')
require('sinatra/reloader')
require('./lib/word')
# require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/')do
  @words = Word.sort
  erb(:home)
end

get('/home')do
  @words = Word.sort
  erb(:home)
end

get('/home/new')do
 erb(:new_word) 
end

post('/home/new')do
  new_word = params[:new_word]
  word = Word.new({:word => new_word, :id => nil})
  word.save()
  redirect to('/home')
end

# make an admin only routing page for delete/renaming!
get('/home/edit/:id')do
  @word = Word.find(params[:id].to_i())
  erb(:admin_edit_word)
end

get('/home/view/:id')do
  @word = Word.find(params[:id].to_i())
  erb(:view)
end

get('/home/:id')do
  @word = Word.find(params[:id].to_i())
end

patch('/home/:id')do
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



# EXAMPLES FOR GET, POST, PATCH & DELETE
# get('/') do
#   @albums = Album.sort
#   erb(:albums) #erb file name
# end

# post('/albums') do ## Adds album to list of albums, cannot access in URL bar
#   name = params[:album_name]
#   artist = params[:album_artist]
#   year = params[:album_year]
#   genre = params[:album_genre]
#   song = params[:song_id]
#   in_inventory = params[:in_inventory]
#   album = Album.new(name, nil, artist, genre, year)
#   album.save()
#   redirect to('/albums')
# end

# patch('/albums/:id') do
#   @album = Album.find(params[:id].to_i())
#   @albums = Album.all
#   if params[:buy]
#     @album.sold()
#   else  
#     @album.update(params[:name])
#   end
#   erb(:albums)
# end

# delete('/albums/:id') do
#   @album = Album.find(params[:id].to_i())
#   @album.delete()
#   redirect to('/albums')
# end