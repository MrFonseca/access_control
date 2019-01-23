module Admin
  module Houses
    class PetsController < Admin::AdminController
      before_action :set_house
      before_action :set_pet, only: %i[edit update destroy]

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

      def edit; end

      def update
        if @pet.update(pet_params)
          redirect_to admin_house_pets_path(@house), notice: "Pet updated"
        else
          render "edit"
        end
      end

      def destroy
        @pet.destroy
        redirect_to admin_house_pets_path(@house), notice: "Pet deleted"
      end

      private

      def pet_params
        params.require(:pet).permit(:name, :species, :breed, :color, :gender, :size)
      end

      def set_house
        @house = House.find(params[:house_id])
      end

      def set_pet
        @pet = @house.pets.find(params[:id])
      end
    end
  end
end
