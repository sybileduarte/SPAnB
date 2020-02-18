class PetsController < ApplicationController
  before_action :find_pet, only: [ :show, :edit, :update, :destroy]
  def index
    @pets = policy_scope(Pet).order(created_at: :desc)
  end

  def show
    authorize @pet
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @pet
    @pet.user = current_user
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

  private

  def pet_params
    params.require(:pet).permit(:name, :race, :age, :description)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end
end
