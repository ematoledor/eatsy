class AddNutritionFactsToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :calories, :string
    add_column :recipes, :carbs, :string
    add_column :recipes, :fat, :string
    add_column :recipes, :protein, :string
  end
end
