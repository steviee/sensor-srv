class Api::ReadingsController < ApplicationController

  def create

    reading = Reading.new
    reading.temperature = params[:temp].to_f / 100
    reading.humidity = params[:hum].to_f / 100
    reading.sensor_id = params[:name]

    if reading.save
      head :created
    else
      head :internal_server_error
    end

  end

  def sensors

    sensors = NoBrainer.run { |r| r.table('readings').group('sensor_id').limit(1).get_field('sensor_id') }

    ret = []
    sensors.keys.each do |s|
      ret << s if s != nil
    end
    render json: ret, status: 200

  end

  def recent

    sensor = params[:sensor_id]

    readings = Reading.where(sensor_id: sensor).limit(12*60*6).order_by(:created_at => :asc)
    temps = []
    hums = []

    readings.each do |r|
      temps << r.temperature
      hums << r.humidity
    end

    render json: { temps: temps, hums: hums }, status: 200

  end

  def latest

    sensor = params[:sensor_id]
    render json: Reading.where(sensor_id: sensor).last, status: 200

  end

end
