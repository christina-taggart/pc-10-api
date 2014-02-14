class Market < ActiveRecord::Base
  DOGE_CRYPTSY_MARKET_ID = 132
  has_many :trades
  validates :name, :description, :cryptsy_market_id,
    uniqueness: true, presence: true

  def update_latest_market_data!
    latest_market_data = self.latest_market_data
    puts "I AM HERE RIGHT NOW============================="
    p latest_market_data
    unless latest_market_data.empty? || latest_market_data.nil?
      self.update_attributes(latest_market_data: latest_market_data)
    end
  end

  def self.first_run
    # TODO some kind of background job or loop that continues
    # until we get a valid reply from Cryptsy
    # They tend to get overloaded and fail a lot.
    cryptsy = Cryptsy::API::Client.new
    @market_data = cryptsy.marketdata(DOGE_CRYPTSY_MARKET_ID)
    market = Hash.new
    market[:name] = @market_data["return"]["markets"].keys.first
    market[:description] = @market_data["return"]["markets"]["DOGE"]["label"]
    market[:cryptsy_market_id] = @market_data["return"]["markets"]["DOGE"]["marketid"]
    market[:latest_market_data] = @market_data
    Market.create(market) 
  end

  # should this be private???
  def latest_market_data
    cryptsy = Cryptsy::API::Client.new
    # TODO: I need exception handling here because
    # when cryptsy fails to respond to my request, 
    # it causes the program to crash.
    cryptsy.marketdata(self.cryptsy_market_id)
  end
end
