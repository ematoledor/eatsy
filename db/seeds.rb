
SPOONACULAR_KEY = "9242419348644293bdd2777dbdf49ac5"
url = "https://api.spoonacular.com/recipes/random?number=100&apiKey=#{SPOONACULAR_KEY}&tag=italian"
recipes_request = HTTParty.get(url)

spoonacular_recipes_params = recipes_request["recipes"]

spoonacular_recipes_params.each do |sr_params|
  recipe = Recipe.create!(
    title:        sr_params["title"],
    instructions: sr_params["instructions"],
    prep_time:    sr_params["readyInMinutes"],
    servings:     sr_params["servings"],
    source_id:    sr_params["id"],
    image:        sr_params["image"],
    vegetarian:   sr_params["vegetarian"],
    gluten_free:  sr_params["gluten_free"],
    vegan:        sr_params["vegan"],
    dairy_free:   sr_params["dairy_free"],
    very_healthy: sr_params["very_healthy"],
    cheap:        sr_params["cheap"],
    very_popular: sr_params["very_popular"],
    ketogenic:    sr_params["ketogenic"],
    summary:      sr_params["summary"],
    calories:     rand(10..700),
    carbs:        rand(1..100),
    fat:          rand(1..100),
    protein:      rand(1..100)
  )
  
  sr_params["extendedIngredients"].each do |ingredient|
    new_ingredient = Ingredient.where(name: ingredient["name"]).first_or_create!  
    new_ingredient.update!(
      image: ingredient["image"],
      price: rand(1.0..3.0).truncate(2)
    )

  
    Portion.create!(
      amount:       ingredient["amount"],
      unit:         ingredient["unit"],
      recipe:       recipe,
      ingredient:   new_ingredient
      
    )
  end
    user = User.all.shuffle[0]
    Review.create!(
      description:  "Easy to cook and delicious.",
      rating:       4,
      recipe:       recipe,
      user:         user
    )          

end

