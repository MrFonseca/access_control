module Admin
  class ResidentsController < Admin::AdminController
    before_action :set_house

    def new
      @resident = @house.residents.new
    end

    def create
      @resident = @house.residents.new(resident_params)

      if @resident.save
        redirect_to admin_house_path(@house), notice: "Resident created"
      else
        render "new"
      end
    end

    private

    def resident_params
      params.require(:person).permit(:name, :document, :phone).merge(access: true)
    end

    def set_house
      @house = House.find(params[:house_id])
    end
  end
end
