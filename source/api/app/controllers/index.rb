get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/users' do
  @username = params[:username]
  redirect "https://api.github.com/users/#{@username}"
end