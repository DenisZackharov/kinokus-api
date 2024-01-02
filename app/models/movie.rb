class Movie < ApplicationRecord
  validates :name, presence: true

  has_one_attached :poster
end
