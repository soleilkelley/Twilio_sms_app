class CarsController < ApplicationController
  before_filter :find_car, only: [:show]

  def new
    @car = Car.new
    @contact = Contact.new
  end

  def create
    @car = Car.create(car_params)
    if @car.save
      redirect_to @car, notice: "Car has been added"
    else
      flash[:alert] = "Car has not been added"
      render action: "new"
    end
  end

  def show
  end

  def index
  end

  private
  def car_params
    params.require(:car).permit(:license_plate, :zip, :state, :terms,
     contact_attributes:[:id, :type, :value])
  end

  def find_car 
    @car = Car.find(params[:id])
  end
end
