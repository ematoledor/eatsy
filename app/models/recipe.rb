class Recipe < ApplicationRecord
  has_many :reviews 
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  has_many_attached :images
end
