# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "json"

url = "https://pokeapi.co/api/v2/pokemon/"
pokemon_api = URI.open(url).read

pokemon_json = JSON.parse(pokemon_api)
# I'm iterating over the results hash, but this hash is inside of the pokemon_json
# hash so, I take that key form the hash.
pokemon_json["results"].each do |result|
  pokemon = Pokemon.new(
    pokemon_name: result["name"],
    info: URI.open(result["url"]).read
  )
  user.save!
end
