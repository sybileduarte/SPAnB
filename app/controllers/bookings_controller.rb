class BookingsController < ApplicationController

  def index
    owner = current_user.id
    @review = Review.new
    @bookings = policy_scope(Booking).where(user_id: owner).order(created_at: :desc)
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.pet = @pet
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to pet_path(@pet)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_id)
  end
end
