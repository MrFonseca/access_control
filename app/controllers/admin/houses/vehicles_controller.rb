module Admin
  module Houses
    class VehiclesController < Admin::AdminController
      before_action :set_house

      def index
        @vehicles = Vehicle.includes(:house).where("plate ILIKE :query", query: "%#{params[:query]}%")
      end

      def add_vehicle
        Vehicle.find(params[:id]).update(house_id: @house.id)
        redirect_to admin_house_path(@house), notice: "Vehicle added"
      end

      private

      def set_house
        @house = House.find(params[:house_id])
      end
    end
  end
end
