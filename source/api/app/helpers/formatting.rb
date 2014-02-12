helpers do
  def fetch_trending(coords)
    trending_places = {}
    coords = coords.join(", ")
    venues = CLIENT.trending_venues(coords, radius: 10000, limit: 20).venues
    if venues.length < 10
      venues = CLIENT.trending_venues(coords, radius: 20000, limit: 20).venues
    end
    venues.each do |venue|
      name = venue.name
      location = venue.location
      address = [location.address, location.city, location.state].join(" ")
      trending_places[name] = {people: venue.hereNow['count'], lat: location.lat, lng: location.lng, address: address}
    end
    trending_places
  end
end
