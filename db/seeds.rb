require 'open-uri'
require 'json'

url = "https://tmdb.lewagon.com/movie/top_rated"

response = URI.open(url).read
data = JSON.parse(response)

index = 0

Movie.destroy_all

20.times do
  Movie.create!(title: "#{data["results"][index]["title"]}", overview: "#{data["results"][index]["overview"]}", poster_url: "https://image.tmdb.org/t/p/original/#{data["results"][index]["poster_path"]}", rating: "#{data["results"][index]["vote_average"]}")
  index = index + 1
  puts "#{index} movie created"
end


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
