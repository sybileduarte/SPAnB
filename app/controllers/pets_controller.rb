class PetsController < ApplicationController
  before_action :find_pet, only: [ :show, :edit, :update, :destroy]
  def index
    @pets = policy_scope(Pet.geocoded).order(created_at: :desc)
    @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end
  end

  def show
    authorize @pet
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet      = Pet.new(pet_params)
    @pet.race_id = [params[:pet][:race_dog].to_i,params[:pet][:race_cat].to_i].max  { |a, b| a<=>b}
    @pet.user = current_user
    authorize @pet
    if @pet.save!
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
    params.require(:pet).permit(:name, :race_dog, :race_cat, :age, :description, :tag_list)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end
end
