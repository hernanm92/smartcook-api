require 'typhoeus'
require 'json'

def get_file(file_name)
  JSON.parse(
    File.read(File.dirname(__FILE__) + '/' + file_name)
  )
end

p 'FOOD CATEGORIES'
food_categories = get_file('food_categories.json')['food_categories']
food_categories.each do |food_category|
  p food_category
  Typhoeus.post(
    'http://localhost:5000/food_categories',
    body: food_category.to_json,
    headers: { 'Content-Type' => 'application/json' }
  )
  sleep(0.2)
end

p 'INGREDIENTS'
ingredients = get_file('ingredients.json')['ingredients']
ingredients.each do |ingredient|
  p ingredient
  Typhoeus.post(
    'http://localhost:5000/ingredients',
    body: ingredient.to_json,
    headers: { 'Content-Type' => 'application/json' }
  )
  sleep(0.2)
end

p 'BADGES'
badges = get_file('badges.json')['badges']
badges.each do |badge|
  p badge
  Typhoeus.post(
    'http://localhost:5000/badges',
    body: badge.to_json,
    headers: { 'Content-Type' => 'application/json' }
  )
  sleep(0.2)
end

p 'USERS'
users = get_file('users.json')['users']
users.each do |user|
  p user
  Typhoeus.post(
    'http://localhost:5000/users',
    body: user.to_json,
    headers: { 'Content-Type' => 'application/json' }
  )
  sleep(0.2)
end

p 'RECIPES'
recipes = get_file('recipes.json')['recipes']
recipes.each do |recipe|
  p recipe
  Typhoeus.post(
    'http://localhost:5000/recipes',
    body: recipe.to_json,
    headers: { 'Content-Type' => 'application/json' }
  )
  # hacer un request por cada ingrediente
  sleep(0.2)
end
