class Race < ApplicationRecord
  has_many :pets
  belongs_to :specie
end
