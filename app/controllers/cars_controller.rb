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

  def receive_text      
      message_body = params["Body"]

      # parse body to separate state from license_plate
      state = message_body[/\s(AL|AK|AS|AZ|AR|CA|CO|CT|DE|DC|FM|FL|GA|GU|HI|ID|IL|IN|IA|KS|KY|LA|ME|MH|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|MP|OH|OK|OR|PW|PA|PR|RI|SC|SD|TN|TX|UT|VT|VI|VA|WA|WV|WI|WY)\z/i]
      range = message_body.length - 3
      license = message_body[0...range]
      pry
      car = Cars.find_by_license(license)

      if car != nil
        for car.contacts.each do |c|
          if c.type == "Phone"
            number_to_send_to = c.value

            if car.nickname
              car_name = car.nickname
            else
              car_name = car.license_plate
            end

            @twilio_client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"]

            @twilio_client.account.sms.messages.create(
              :from => "+1" + ENV["TWILIO_PHONE_NUMBER"],
              :to => number_to_send_to,
              :body => "Someone has notified us that you should go back to your car: " + car_name
            )
          elsif c.type == "Email"
            # send email
          end
        end
      end
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
