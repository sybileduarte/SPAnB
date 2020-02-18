class Pet < ApplicationRecord
  attr_accessor :race_cat
  attr_accessor :race_dog
  belongs_to :user
  has_many :bookings
  belongs_to :race

  validates :name, presence: true
  validates :race, presence: true
  validates :age, presence: true
  validates :description, presence: true
end
