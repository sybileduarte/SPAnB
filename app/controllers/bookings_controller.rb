class BookingsController < ApplicationController
  def index
    @user_bookings = Booking.all
    # @pet_bookings =

  end

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = @booking.pet
    if @booking.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_id)
  end
end
