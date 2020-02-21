class Pet < ApplicationRecord
  attr_accessor :race_cat
  attr_accessor :race_dog
  belongs_to :user
  has_many :bookings
  belongs_to :race
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :race, presence: true
  validates :age, presence: true
  validates :description, presence: true
  validates :photos, presence: true
  validates :address, presence: true
  validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  acts_as_taggable
  has_many_attached :photos
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :description, :name ],
    associated_against: {
      race: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }

    def self.available(period)
      pets = Pet.all
      pets_available = []
      pets.each do |pet|
        not_available = pet.bookings.any? do |booking|
          period.overlaps?(booking.period)
        end
        pets_available << pet unless not_available
      end
      return pets_available
    end
end
