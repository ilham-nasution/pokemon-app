require  "json"
require "open-uri"

url = 'https://pokeapi.co/api/v2/pokemon/?limit=100'
data = open(url).read
pokemons = JSON.parse(data)

puts "Creating pokemons..."
pokemons["results"].each do |pokemon|
  Pokemon.create!(name: pokemon["name"])
end
puts "....Finished"

pokemons = Pokemon.all
pokemons.each do |pokemon|
  url2 = "https://pokeapi.co/api/v2/pokemon/#{pokemon.name}"
  data2 = open(url2).read
  pokemonImg = JSON.parse(data2)
  puts "Insert pokemon images..."
  pokemon.remote_photo_url = pokemonImg["sprites"]["front_default"]
  pokemon.save!
  puts "....Finished"
end

pokemons2 = Pokemon.all
pokemons2.each do |pokemon|
  url3 = "https://pokeapi.co/api/v2/pokemon/#{pokemon.name}"
  data3 = open(url3).read
  pokemons2 = JSON.parse(data3)
  puts "Insert pokemon moves..."
  pokemons2["moves"].shuffle.first(3).each do |move|
    mm = Move.new(name: move["move"]["name"])
    mm.pokemon = pokemon
    mm.save!
  end
  puts "....Finished"
end

pokemons3 = Pokemon.all
pokemons3.each do |pokemon|
  url4 = "https://pokeapi.co/api/v2/pokemon/#{pokemon.name}"
  data4 = open(url4).read
  pokemons3 = JSON.parse(data4)
  puts "Insert pokemon types..."
  pokemons3["types"].each do |type|
    tt = Type.new(name: type["type"]["name"])
    pp = PokemonType.new
    pp.type = tt
    pp.pokemon = pokemon
    pp.save!
  end
  puts "....Finished"
end
