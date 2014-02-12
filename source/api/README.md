# CryptSeer.com
Simple Cryptocoin tools and perhaps more...  

![dogecoin logo](http://i2.minus.com/iHZZfPu6d8qpF.png "To the moon!")  

how money!    
such profit!    
much amaze!  
definitely not a ponzi!  

## Overview  
### How it all works  
  
We use the coinbase api to get the current spot price of 1 bitcoin. (the current going price of 1 bitcoin in USD)  
  
We pull current DOGE/BTC market data from Cryptsy.  

With both pieces of data, we can calculate the value of 1 DOGE in terms of USD.  

We save trade, market, and exchange rate data in the database (saving exch rates is pending TODO) so that we can retrieve data if one of the API fails or their service is overloaded (quite common).  

The code is messy, but the goal is a working MVP by 11-2-14 23:59 PST.  

Main competitor is http://www.dogetools.com/calc/  

## Dependencies
### Using the 'Cryptsy' API  

https://www.cryptsy.com/pages/api  

### Using Cryptsy-API Ruby gem  
  
https://github.com/nbarthel/cryptsy-api  
  
### Using HTTParty gem

This one is used to make requests to the coinbase api. It's already required by the cryptsy-api gem, but here's the link for reference:  
  
https://github.com/jnunemaker/httparty

### Using Coinbase API  

https://coinbase.com/api/doc/1.0/prices/spot_rate.html

## Database Schema 

![database schema](http://i1.minus.com/ibazejnJMECRx4.png "Keep It Simple Stupid!")  

http://en.wikipedia.org/wiki/Keep_it_simple_stupid

## Things to watch out for
### Cross-site AJAX Requests
Don't do it! CORS will bite you.  

![alligators](http://i3.minus.com/ibuNfX6paonaHz.jpg)  
  
Use Net::HTTP, HTTParty, or just the Cryptsy-API Ruby gem instead.

Read more about it here: http://en.wikipedia.org/wiki/Cross-origin_resource_sharing

