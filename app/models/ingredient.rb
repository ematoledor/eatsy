class Ingredient < ApplicationRecord
  belongs_to :portion

  validates :name, uniqueness: true

end
