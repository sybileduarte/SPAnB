class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    authorize @review
    if @review.save
      redirect_to bookings_path
    else
      render "bookings"
    end
  end


  private

  def review_params
    params.require(:review).permit(:content,:rating)
  end
end
