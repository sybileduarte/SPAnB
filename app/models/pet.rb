class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :race, presence: true
  validates :age, presence: true
  validates :description, presence: true
end
