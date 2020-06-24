class AddIngredientIdToPortion < ActiveRecord::Migration[6.0]
  def change
    add_reference :portions, :ingredient, null: false, foreign_key: true
  end
end
