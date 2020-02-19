class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :reviews
  validate :end_after_start
  validates :start_date, presence: true
  validates :end_date, presence: true

  def period
    start_date..end_date
  end

private

  def end_after_start
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

#SHOULD WE JUST PUT THIS IN OUR CONTROLLER ?
  # def validate_other_booking_overlap
  #   other_bookings = Pet.new.bookings
  #   is_overlapping = other_bookings.any? do |other_booking|
  #     period.overlaps?(other_booking.period)
  #   end
  #   errors.add(:overlaps_with_other) if is_overlapping
  # end

end
