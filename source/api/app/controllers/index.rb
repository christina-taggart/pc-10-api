get '/' do
  # Look in app/views/index.erb
  response = HTTParty.get("https://openapi.etsy.com/v2/listings/active?api_key=#{ENV['ETSY_KEY']}")

  @titles = response.parsed_response["results"].map { |listing| listing["title"] }

  erb :index
end

get '/bands' do
  @band_names = Band.all.map(&:name)
  erb :bands
end

post '/bands' do
  new_band = Band.create!(name: params[:name])
  new_band.name
end

get '/info' do
  Demo.new(self).info
end
