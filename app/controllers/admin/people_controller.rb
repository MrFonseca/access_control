module Admin
  class PeopleController < Admin::AdminController
    before_action :set_person, only: %i[edit show update destroy]

    def index
      @people = Person.includes(:house).order("houses.number")
    end

    def new
      @person = Person.new
    end

    def create
      @person = Person.new(person_params)

      if @person.save
        redirect_to admin_person_path(@person)
      else
        render "new"
      end
    end

    def show; end

    def edit; end

    def update
      if @person.update(person_params)
        redirect_to admin_person_path(@person)
      else
        render "edit"
      end
    end

    def destroy
      @person.destroy
      redirect_to admin_people_path
    end

    private

    def person_params
      params.require(:person).permit(:name, :document, :phone, :access, :house_id)
    end

    def set_person
      @person = Person.find(params[:id])
    end
  end
end
