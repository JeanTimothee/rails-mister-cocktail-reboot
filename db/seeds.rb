require 'json'
require 'open-uri'
require 'faker'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
hash_serialized = open(url).read
ingredient_hash = JSON.parse(hash_serialized)

puts 'Destroying everything haaaa'
puts ""

Cocktail.destroy_all
Ingredient.destroy_all

puts 'Creating ingredients...'

ingredient_hash['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

puts "------ #{Ingredient.all.count} ingredients created !!------"
puts ""

puts 'Creating ingredients...'
puts ""
10.times do
  cocktail = Cocktail.create!(name: Faker::Name.name_with_middle)
  Dose.create!(cocktail_id: cocktail.id, description: Faker::GreekPhilosophers.quote, ingredient_id: Ingredient.all.sample.id)
  Dose.create!(cocktail_id: cocktail.id, description: Faker::GreekPhilosophers.quote, ingredient_id: Ingredient.all.sample.id)
end

puts "------ #{Cocktail.all.count} Cocktails created !!------"
