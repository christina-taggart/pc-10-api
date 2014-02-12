helpers do
  def fetch_trending
    trending_places = {}
    CLIENT.trending_venues('37.7833, -122.4167', radius: 2000, limit: 20).venues.each do |venue|
      name = venue.name
      location = venue.location
      address = [location.address, location.city, location.state].join(" ")
      trending_places[name] = {people: venue.hereNow['count'], lat: location.lat, lng: location.lng, address: address}
    end
    trending_places
  end
end
