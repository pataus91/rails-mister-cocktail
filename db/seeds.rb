# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Cleaning database..."
Ingredient.destroy_all
puts "Creating ingredients..."

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

drinks = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
drinks["drinks"].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end

puts "Finished!"
