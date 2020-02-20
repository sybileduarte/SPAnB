class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_one :review
  validate :end_after_start
  validate :validate_other_booking_overlap
  validates :start_date, presence: true
  validates :end_date, presence: true

  def

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

  def validate_other_booking_overlap
    # other_bookings = self.pet.bookings
    # is_overlapping = other_bookings.any? do |other_booking|
    #   period.overlaps?(other_booking.period)
    # end
    # errors.add(:overlaps_with_other) if is_overlapping

    self.pet.bookings.any? do |other_booking|
      return errors.add(:overlaps_with_other) if period.overlaps?(other_booking.period)
    end
  end

end
