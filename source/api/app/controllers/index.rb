get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/foods' do
  @food = NutritionGetter.first_result(params[:food])
  erb :index
end