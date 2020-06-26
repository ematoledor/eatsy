class Ingredient < ApplicationRecord
  has_many :portions, dependent: :destroy
  validates :name, uniqueness: true


end
