class Meal < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 6, maximum: 100 }
  validates :name, uniqueness: true
  validates :ingredients, presence: true, length: {minimum: 0, maximum: 1000 }
  validates :servings_minimum, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :price_minimum, numericality: { greater_than_or_equal_to: 0.01 }
  validates :cover_image, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
end