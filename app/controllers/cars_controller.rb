class CarsController < ApplicationController
  def new
    @car = Cars.new
  end

  def create
    @car = Cars.new(params[:cars])
    if @cars.save
      redirect_to @car, notice: "Car has not been added"
    else
      flash[:alert] = "Car has been added"
      render action: new
    end
  end
end
