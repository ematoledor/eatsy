class Recipe < ApplicationRecord
  has_many :reviews 
  has_many :users, through: :reviews
  has_many :categories, through: :recipe_category
  has_many :ingredients, through: :portions
  belongs_to :lists, through: :list_recipes
end