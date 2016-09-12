class Api::ReadingsController < ApplicationController

  def create

    reading = Reading.new
    reading.temperature = params[:temp]
    reading.humidity = params[:hum]
    reading.sensor_id = params[:name]

    if reading.save
      head :created
    else
      head :internal_server_error
    end

  end

end
