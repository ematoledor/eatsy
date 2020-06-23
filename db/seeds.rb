# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry-byebug'
SPOONACULAR_KEY = "9242419348644293bdd2777dbdf49ac5"
url = "https://api.spoonacular.com/recipes/random?number=100&apiKey=#{SPOONACULAR_KEY}"
recipes_request = HTTParty.get(url)

spoonacular_recipes_params = recipes_request["recipes"]
spoonacular_recipes_params.each do |sr_params|
  # columns               keys on spoonacular
  Recipe.create!(
    title:        sr_params["title"], # title
    instructions: sr_params["instructions"], # instructions
    prep_time:    sr_params["readyInMinutes"], # prep_time
    servings:     sr_params["servings"], # servings
    source_id:    sr_params["id"], # source_url >>>> change to source_id ??? 1098388
    image:        sr_params["image"], # image
    vegetarian:   sr_params["vegetarian"], # summary
    gluten_free:  sr_params["gluten_free"],
    vegan:        sr_params["vegan"],
    dairy_free:   sr_params["dairy_free"],
    very_healthy: sr_params["very_healthy"],
    cheap:        sr_params["cheap"],
    very_popular: sr_params["very_popular"],
    ketogenic:    sr_params["ketogenic"]
  )
end 