get '/' do
  # Fatty controller but MVP first, refactor second.
  begin
    cryptsy = Cryptsy::API::Client.new
    @market_data = cryptsy.marketdata(132) # DOGE is 132 
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

    latest_trade = Trade.last    
    btc_price_per_coin_display = sprintf("%0.08f", latest_trade.btc_price_per_coin)
    @last_trade_price = btc_price_per_coin_display
    @last_trade_time = latest_trade.executed_at

    @current_btc_spot_price = HTTParty.get('https://coinbase.com/api/v1/prices/spot_rate')["amount"].to_f

  rescue Exception => ex  
    # do stuff to prevent a crash from 502 service overload 
    # error from Cryptsy
    puts "-------------------------------"
    puts "likely 502 ERROR from CRYPTSY"
    puts "loading data from local cache"
    puts ex.message
    puts ex.backtrace.join("\n")
    puts "-------------------------------"

    # TODO: This should be DRY'd
    latest_trade = Trade.last    
    btc_price_per_coin_display = sprintf("%0.08f", latest_trade.btc_price_per_coin)
    @last_trade_price = btc_price_per_coin_display
    @last_trade_time = latest_trade.executed_at
    @current_btc_spot_price = HTTParty.get('https://coinbase.com/api/v1/prices/spot_rate')["amount"].to_f
    @secret_fail_msg = ":-)"
  end

  erb :index
end
