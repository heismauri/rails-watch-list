# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

APIKEY = '8fbf15f1de86d59aab28eb1242ff1888'.freeze

tmdb_response = URI.open("http://api.themoviedb.org/3/movie/top_rated?api_key=#{APIKEY}&language=en-US&page=1")
tmdb_json = JSON.parse(tmdb_response.read)

tmdb_json['results'].slice(0, 10).each do |movie|
  new_movie = Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/original/#{movie['poster_path']}",
    rating: movie['vote_average']
  )
  puts "Movie #{new_movie.id}"
end
