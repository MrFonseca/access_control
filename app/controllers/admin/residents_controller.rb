module Admin
  class ResidentsController < Admin::AdminController
    before_action :set_house
    before_action :set_resident, only: %i[edit show update destroy]

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

    def show; end

    def edit; end

    def update
      if @resident.update(resident_params)
        redirect_to admin_house_resident_path(@house, @resident), notice: "Resident updated"
      else
        render "edit"
      end
    end

    def destroy
      @resident.update(house_id: nil, access: false)
      redirect_to admin_house_path(@house), notice: "#{@resident.name} moved out from #{@house.number}"
    end

    private

    def resident_params
      params.require(:resident).permit(:name, :document, :phone).merge(access: true)
    end

    def set_house
      @house = House.find(params[:house_id])
    end

    def set_resident
      @resident = @house.residents.find(params[:id])
    end
  end
end
