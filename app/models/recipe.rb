class Recipe < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  has_many_attached :images
  has_many :portions, dependent: :destroy
end
