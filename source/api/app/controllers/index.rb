require 'flickraw'

FlickRaw.api_key= "da3edd0ed10bda12ef1821af5ef42a8d"

FlickRaw.shared_secret= "3b0d25df9725a043"

list   = flickr.photos.getRecent



random = rand(100)


get '/' do
	id = list[0].id
	secret = list[0].secret
	info = flickr.photos.getInfo :photo_id => id, :secret => secret
	@photo_url = info.urls[0]["_content"]

	random = rand(100)
	rand_id = list[random].id
	rand_secret = list[random].secret
	rand_info = flickr.photos.getInfo :photo_id => id, :secret => secret
	@random_user_url = FlickRaw.url_profile(info)

	@random_username = flickr.people.getInfo({ :user_id => info["owner"]["nsid"] })["realname"]
	p @random_username
	erb :index 
end