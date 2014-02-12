CLIENT = SoundCloud.new(:client_id => 'ef21557fb8bac5d96f80e45064d414a2')

get '/' do
  erb :index
end

post '/songs' do 
	p params
	@artist = params[0]
	@tracks = CLIENT.get('/tracks', :limit => 5, :username => params[:artist])
	erb :songs
end

post '/genre' do 
	p params
	@tracks = CLIENT.get('/tracks', :limit => 10, :genre=> params[:genre])
	erb :songs
end


# client ID:  ef21557fb8bac5d96f80e45064d414a2
# Secret Key:  27564fd5fb4006639697873dc1393fb7
# end user autherizatioon: https://soundcloud.com/connect
# token: https://api.soundcloud.com/oauth2/token