# CryptSeer.com
Simple Cryptocoin tools and perhaps more...

## Dependencies
### Using the 'Cryptsy' API  

https://www.cryptsy.com/pages/api  

### Using Cryptsy-API Ruby gem  
  
https://github.com/nbarthel/cryptsy-api

## Things to watch out for
### Cross-site AJAX Requests
Don't do it! CORS will bite you. Use Net::HTTP, HTTParty, or just the Cryptsy-API Ruby gem instead.

Read more about it here: http://en.wikipedia.org/wiki/Cross-origin_resource_sharing

