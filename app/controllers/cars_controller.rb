class CarsController < ApplicationController
  before_filter :find_car, only: [:show]

  def new
    @car = Car.new
    @car.contacts.build
  end

  def create
    @car = Car.new(car_params)
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
    state = message_body[/(AL|AK|AS|AZ|AR|CA|CO|CT|DE|DC|FM|FL|GA|GU|HI|ID|IL|IN|IA|KS|KY|LA|ME|MH|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|MP|OH|OK|OR|PW|PA|PR|RI|SC|SD|TN|TX|UT|VT|VI|VA|WA|WV|WI|WY)\z/i]
    range = message_body.length - 3
    license = message_body[0...range]
    car = Car.where(license_plate: license, state: state)

    if car[0] != nil
      car[0].contacts.each do |c|
        if c.kind == "phone"
          number_to_send_to = c.value

          if car[0].nickname
            name = car[0].nickname
          else
            name = car[0].license_plate
          end

          @twilio_client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"]

          @twilio_client.account.sms.messages.create(
            :from => "+1" + ENV["TWILIO_PHONE_NUMBER"],
            :to => number_to_send_to,
            :body => "Someone has notified us that you should go back to your car: " + car_name
          )
        elsif c.kind == "Email"
          # send email
        end
      end
    end
  end
  
  private
  def car_params
    params.require(:car).permit(:license_plate, :zip, :state, :terms, :nickname, contacts_attributes:[:id, :kind, :value])
  end

  def find_car 
    @car = Car.find(params[:id])
  end

end
