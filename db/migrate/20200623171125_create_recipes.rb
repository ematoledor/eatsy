class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :instructions
      t.integer :prep_time
      t.boolean :vegetarian
      t.boolean :vegan
      t.boolean :gluten_free
      t.boolean :diary_free
      t.boolean :very_healthy
      t.boolean :cheap
      t.boolean :very_popular
      t.boolean :ketogenic
      t.integer :servings
      t.string :source_url
      t.string :image
      t.string :summary

      t.timestamps
    end
  end
end
