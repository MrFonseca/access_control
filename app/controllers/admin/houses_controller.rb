module Admin
  class HousesController < Admin::AdminController
    before_action :set_house, only: %i[edit show update]

    def index
      @houses = House.all
    end

    def new
      @house = House.new
    end

    def create
      @house = House.new(house_params)

      if @house.save
        redirect_to admin_house_path(@house)
      else
        render "new"
      end
    end

    def show; end

    def edit; end

    def update
      if @house.update(house_params)
        redirect_to admin_house_path(@house)
      else
        render "edit"
      end
    end

    def destroy
      @house = House.find(params[:id])
      @house.destroy
      redirect_to admin_houses_path
    end

    private

    def house_params
      params.require(:house).permit(:number, :address, :route, :status)
    end

    def set_house
      @house = House.find(params[:id])
    end
  end
end
