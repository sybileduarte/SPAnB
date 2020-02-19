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
  validates :photo, presence: true
  validates :address, presence: true
  validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  acts_as_taggable
  has_one_attached :photo

end
