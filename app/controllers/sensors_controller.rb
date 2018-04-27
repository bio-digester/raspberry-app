class SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :update, :destroy]

  # GET /sensors
  def index
    @sensors = Sensor.all
    json_response(@sensors)
  end

  # POST /sensors
  def create
    @sensor = Sensor.create!(sensor_params)
    json_response(@sensor, :created)
  end

  # GET /sensors/:id
  def show
    json_response(@sensor)
  end

  # PUT /sensors/:id
  def update
    @sensor.update(sensor_params)
    head :no_content
  end

  # DELETE /sensors/:id
  def destroy
    @sensor.destroy
    head :no_content
  end

  private

  def sensor_params
    # whitelist params
    params.permit(:name)
  end

  def set_sensor
    @sensor = Sensor.find(params[:id])
  end

end
