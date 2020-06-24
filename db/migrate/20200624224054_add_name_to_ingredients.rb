class AddNameToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :name, :string
  end
end
