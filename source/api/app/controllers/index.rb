get '/' do
  cryptsy = Cryptsy::API::Client.new
  p cryptsy.marketdata(132)
  erb :index
end
