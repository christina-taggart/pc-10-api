require 'json'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/trending' do
  coords = params[:coords]
  @results = fetch_trending(coords)
  content_type 'application/json'
  halt 200, { results: @results }.to_json

end