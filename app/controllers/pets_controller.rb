class PetsController < ApplicationController
  before_action :find_pet, only: [ :show, :edit, :update, :destroy]

  TAGS = ["Calin","Joueur","Sportif","Protecteur","Dormeur","Bon vivant"]
  def index
    @pets = policy_scope(Pet.geocoded).order(created_at: :desc)
    @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pet: pet })
      }
    end
  end

  def show
    authorize @pet
    @booking = Booking.new
    @bookings = Booking.where(pet_id: @pet.id)
    @bookings_dates = @bookings.map do |booking|
     {
       from: booking.start_date,
       to:   booking.end_date
     }
    end
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet      = Pet.new(pet_params)
    @pet.race_id = [params[:pet][:race_dog].to_i,params[:pet][:race_cat].to_i].max  { |a, b| a<=>b}
    tag_list = params[:pet][:tag_list].split(",")
    new_tag_list = []
    TAGS.each do |tag|
      if tag_list.count(tag) > 0
        new_tag_list << tag
      end
    end

    @pet.tag_list = new_tag_list
    @pet.user = current_user
    authorize @pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
    authorize @pet
  end

  def update
    authorize @pet
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def destroy
    authorize @pet
    @pet.destroy
    redirect_to pets_path
  end

  def tagged
    if params[:tag].present?
      @pets= Pet.tagged_with(params[:tag])
    else
      @pets = Pet.all
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :race_dog, :race_cat, :age, :description, :tag_list, :address, :price, photos: [])
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end
end
