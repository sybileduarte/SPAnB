class Specie < ApplicationRecord
  has_many :races
  validates :name, uniqueness: true
end
