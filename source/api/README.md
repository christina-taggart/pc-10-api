# An app for finding others like you
```
go to
https://github.com/shkurkin/shkurkin.github.io
to view the repository
```
### Find yourself, or at least others like you.

Enter your name into the seach bar to see where other people that have the same name as you live. If you're lucky, you'll get a picture as well.

API's used
- Google Maps
- Google GeoLocation
- PIPL

How I am using the APIs
- 1. the user enters their name
- 2. the name is passed to the PIPL api as a url request.
- 3. Pipl returns a JSON object with info of all people who have the same name
- 4. Pass location info from PIPL to the geocoder api.
- 5. the geocoder will give lat lng
- 6. make markers with lat lng and info from PIPL
