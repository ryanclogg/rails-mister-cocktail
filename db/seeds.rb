# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "rest-client"
require "ap"

response = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
repos = JSON.parse(response)

drinks = repos["drinks"]

drinks.each do |ingredient|
  ingr = ingredient["strIngredient1"]
  Ingredient.create(name: ingr)
end

# Ingredient.create(name: 'Lemon Juice')
# Ingredient.create(name: 'Gin')
# Ingredient.create(name: 'Angostura bitters')
# Ingredient.create(name: 'Lime Juice')
# Ingredient.create(name: 'Whiskey')
# Ingredient.create(name: 'Simple syrup')
# Ingredient.create(name: 'Sweet vermouth')
# Ingredient.create(name: 'Lemon')
# Ingredient.create(name: 'Bourbon')
# Ingredient.create(name: 'Orange bitters')
# Ingredient.create(name: 'Dry vermouth')
# Ingredient.create(name: 'Cherry liqueur')
# Ingredient.create(name: 'Light Rum')
# Ingredient.create(name: 'Orange')
# Ingredient.create(name: 'Herbal Liqueur')
# Ingredient.create(name: 'Tequila')
# Ingredient.create(name: 'Vodka')
# Ingredient.create(name: 'Orange liqueur')
# Ingredient.create(name: 'Campari')

