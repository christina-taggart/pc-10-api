require 'json'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/trending' do
  @results = fetch_trending
  content_type 'application/json'
  halt 200, { results: @results }.to_json

end