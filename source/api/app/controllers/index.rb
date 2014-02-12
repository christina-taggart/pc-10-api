get '/' do
  cryptsy = Cryptsy::API::Client.new
  @market_data = cryptsy.marketdata(132)
  @last_trade_price = @market_data["return"]["markets"]["DOGE"]["lasttradeprice"]
  @last_trade_time = @market_data["return"]["markets"]["DOGE"]["lasttradetime"]

  params[:name] = @market_data["return"]["markets"].keys.first
  params[:description] = @market_data["return"]["markets"]["DOGE"]["label"]
  Market.create(params)





  erb :index
end
