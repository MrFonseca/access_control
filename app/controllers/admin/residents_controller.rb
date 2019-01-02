module Admin
  class ResidentsController < Admin::AdminController
    before_action :set_house

    def index
      @people = Person.where("name ILIKE :query OR document ILIKE :query OR phone ILIKE :query", query: "%#{params[:query]}%")
    end

    def add_person
      Person.find(params[:id]).update(house_id: @house.id)
      redirect_to admin_house_path(@house), notice: "Resident added"
    end

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

    def show
      @resident = @house.residents.find(params[:id])
    end

    private

    def resident_params
      params.require(:resident).permit(:name, :document, :phone).merge(access: true)
    end

    def set_house
      @house = House.find(params[:house_id])
    end
  end
end
