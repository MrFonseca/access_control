module Admin
  class PetsController < Admin::AdminController
    before_action :set_house

    def index
      @pets = @house.pets
    end

    def new
      @pet = @house.pets.new
    end

    def create
      @pet = @house.pets.new(pet_params)

      if @pet.save
        redirect_to admin_house_pets_path(@house), notice: "Pet created"
      else
        render "new"
      end
    end

    private

    def pet_params
      params.require(:pet).permit(:name, :species, :breed, :color, :gender, :size)
    end

    def set_house
      @house = House.find(params[:house_id])
    end
  end
end
