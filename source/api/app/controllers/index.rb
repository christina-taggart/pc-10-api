get '/' do
  cryptsy = Cryptsy::API::Client.new
  @market_data = cryptsy.marketdata(132)
  @last_trade_price = @market_data["return"]["markets"]["DOGE"]["lasttradeprice"]
  @last_trade_time = @market_data["return"]["markets"]["DOGE"]["lasttradetime"]


  # TODO: This should not be run everytime the page is visited
  params[:name] = @market_data["return"]["markets"].keys.first
  params[:description] = @market_data["return"]["markets"]["DOGE"]["label"]
  market = Market.create(params)

  # TODO: We are assuming there is only 1 market right now
  # the DOGE market (cryptsy market id 132)
  most_recent_trade = @market_data["return"]["markets"]["DOGE"]["recenttrades"].first
  market.trades << Trade.create({
    market_id: Market.first.id,
    transaction_id: most_recent_trade["id"].to_i,
    btc_price_per_coin: most_recent_trade["price"],
    quantity: most_recent_trade["quantity"].to_f,
    btc_total: most_recent_trade["total"].to_f,
    executed_at: most_recent_trade["time"]
    })

# btc_price_per_coin_display = sprintf("%0.08f", price)
# {"id"=>"23102326", "time"=>"2014-02-11 22:51:13", "price"=>"0.00000288", "quantity"=>"24836.87714254", "total"=>"0.07153021"}


  erb :index
end
