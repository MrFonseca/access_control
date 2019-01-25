module Admin
  module Houses
    class VehiclesController < Admin::AdminController
      before_action :set_house
      before_action :set_vehicle, only: :show

      def index
        @vehicles = Vehicle.includes(:house).where("plate ILIKE :query", query: "%#{params[:query]}%")
      end

      def add_vehicle
        Vehicle.find(params[:id]).update(house_id: @house.id)
        redirect_to admin_house_path(@house), notice: "Vehicle added"
      end

      def new
        @vehicle = @house.vehicles.new
      end

      def create
        @vehicle = @house.vehicles.new(vehicle_params)

        if @vehicle.save
          redirect_to admin_house_path(@house), notice: "Vehicle created"
        else
          render "new"
        end
      end

      def show; end

      private

      def vehicle_params
        params.require(:vehicle).permit(:plate, :brand, :model, :color, :year)
      end

      def set_house
        @house = House.find(params[:house_id])
      end

      def set_vehicle
        @vehicle = @house.vehicles.find(params[:id])
      end
    end
  end
end
