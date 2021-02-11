require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
hash_serialized = open(url).read
ingredient_hash = JSON.parse(hash_serialized)

puts 'Creating ingredients...'

ingredient_hash['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

puts "------ #{Ingredient.all.count} ingredients created !!------"
