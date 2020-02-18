class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  belongs_to :race

  validates :name, presence: true
  validates :race, presence: true
  validates :age, presence: true
  validates :description, presence: true
end
