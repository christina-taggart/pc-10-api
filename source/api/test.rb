require 'rubygems'
require 'imdb'

print "Please enter full or partial movie title to search for: "
title = gets

results = Imdb::Search.new(title)
puts results.movies.length
puts "------ Matching Movies -------"
first = results.movies[0].id
puts results.movies[0..9].collect{ |movie| [movie.id, movie.title].join(" - ") }.join("\n")

# functionality test to locate details of a movie"
movie = Imdb::Movie.new(first)
puts ""
puts "--------- Movie Title -------------"
puts movie.title
puts "--------- Release Year -------------"
puts movie.year
puts "--------- IMDB Rating -------------"
puts movie.rating
puts "--------- Main Cast -------------"
puts movie.cast_members[0..2].join(", ")
