module Admin
  class PetsController < Admin::AdminController
    before_action :set_house

    def index
      @pets = @house.pets
    end

    private

    def set_house
      @house = House.find(params[:house_id])
    end
  end
end
