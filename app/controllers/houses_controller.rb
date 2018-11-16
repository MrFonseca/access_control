class HousesController < ApplicationController
  def index
    @houses = House.all

    @house = House.new
  end

  def create
    House.create(house_params)
    redirect_to "/houses"
  end

  def destroy
    House.find(params[:id]).destroy
    redirect_to "/houses"
  end

  private

  def house_params
    params.require(:house).permit(:number, :address, :route, :status)
  end
end
