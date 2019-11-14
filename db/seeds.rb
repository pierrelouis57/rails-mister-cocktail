# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# frozen_string_literal: true

require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
data = open(url).read
ingredients = JSON.parse(data)
drinks = ingredients['drinks']

puts 'adding ingredients'

drinks.each do |drink|
  ingredient = Ingredient.new(name: drink['strIngredient1'])
  ingredient.save
end

puts 'finished!'
