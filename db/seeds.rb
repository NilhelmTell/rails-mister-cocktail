require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = open(url).read
ingredients_list = JSON.parse(ingredients)

ingredients_list['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end
