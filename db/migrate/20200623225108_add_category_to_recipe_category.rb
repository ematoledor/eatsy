class AddCategoryToRecipeCategory < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipe_categories, :category, null: false, foreign_key: true
  end
end
