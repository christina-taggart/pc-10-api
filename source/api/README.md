## Using the 'Etsy' API

.... write your tutorial here ....

To find the most recent listings added to Etsy I used the following endpoint. It defaults to 25 results returned.

```
https://openapi.etsy.com/v2/listings/active?
```

Documentation I used can be found here:

```
https://www.etsy.com/developers/documentation/reference/listing
```

Key attributes I pulled from listings:
*url - url to item listing
*title - title of product
*views - number of non-api views product has received

Note- I am using dotenv gem to help hide my api key when I push to github
