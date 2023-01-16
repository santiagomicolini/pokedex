# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "json"

Pokemon.destroy_all

# save the url in to a variable
url = "https://pokeapi.co/api/v2/pokemon/?limit=151"

# URI.open, open a conection with the url that we just saved and read the content
# returns this content as a string
pokemon_api = URI.open(url).read
# With JSON.parse, take the string that we just get as an argument
# and convert the string into a hash
pokemons_json = JSON.parse(pokemon_api)

# I take that hash and I grab the results array inside of it
# After that I iterate over this array to get info of every pokemon
pokemons_json["results"].each do |pokemon|
  # I'll create new pokemons that will have a name, ability, weight, image, evolutions and description attributes
  # pokemon name
  pkmn = Pokemon.new(name: pokemon["name"])

  # i create a new variable to store all the info of every particular pokemon
  pokemon_info = JSON.parse(URI.open(pokemon["url"]).read)

  # ability

  ability_arr = []

  # From the pokemon_info hash I take the abilities array and I iterete over to
  # get evey ability of each pokemon. I store that data in the array ability_arr
  # pushing the data in each iteration.

  pokemon_info["abilities"].each do |ability|
    ability_arr << ability["ability"]["name"]
  end

  #
  pkmn.abilities = ability_arr

  # weight

  pkmn.weight = pokemon_info["weight"]

  # image

  pkmn.image = pokemon_info["sprites"]["other"]["dream_world"]["front_default"]

  # evolutions
  ev_arr = []

  species = JSON.parse(URI.open(pokemon_info["species"]["url"]).read)
  chain = JSON.parse(URI.open(species["evolution_chain"]["url"]).read)

  ev_arr << chain["chain"]["species"]["name"]
  ev_arr << chain["chain"]["evolves_to"][0]["species"]["name"] unless chain["chain"]["evolves_to"][0].nil?
  unless ev_arr.length == 1
    ev_arr << chain["chain"]["evolves_to"][0]["evolves_to"][0]["species"]["name"] unless chain["chain"]["evolves_to"][0]["evolves_to"][0].nil?
  end

  pkmn.evolutions = ev_arr

  # descriptions
  type_arr = []
  pokemon_info["types"].each do |type_hash|
    type_arr << type_hash["type"]["name"]
  end

  pkmn.descriptions = type_arr

  pkmn.save!
  puts "#{pkmn.name} saved!"
end
