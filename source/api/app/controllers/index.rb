get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/foods' do
  @foods = NutritionGetter.first_x_results(params[:food], params[:results_number].to_i)
  @search_term = params[:food]
  erb :index
end