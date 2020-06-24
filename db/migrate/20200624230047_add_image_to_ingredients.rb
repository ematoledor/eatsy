class AddImageToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :image, :string
  end
end
