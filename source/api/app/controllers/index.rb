get '/' do
  # Fatty controller but MVP first, refactor second.
  begin
    # TODO: this should be moved elsewhere...
    if Market.all.empty?
      @market_data = Market.first_run
    else
      current_market = Market.first # for now....
      # TODO create constant instead of magic num 132 for DOGE mkt
      
      if (Time.now.hour == current_market.updated_at.min) && (Time.now.day == current_market.updated_at.day)
        if Time.now.min > current_market.updated_at.min
          puts "======= UPDATING THE MARKET DATA"
          current_market.update_latest_market_data!
        else
          @market_data = current_market.latest_market_data
          puts "====================================="
          puts "did not update market data, only doing that once per min"
          puts "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"
        end
      else
        puts "============ UPDATING THE MARKET DATA"
        current_market.update_latest_market_data!
        
      end
      @market_data = Market.first.latest_market_data
    end
    
    # TODO: This should not be run everytime the page is visited
    # params[:name] = @market_data["return"]["markets"].keys.first
    # params[:description] = @market_data["return"]["markets"]["DOGE"]["label"]
    # params[:cryptsy_market_id] = @market_data["return"]["markets"]["DOGE"]["marketid"]
    # market = Market.create(params)  
    market = Market.first # REMOVE ME
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
