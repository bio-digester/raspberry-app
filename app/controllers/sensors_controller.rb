class SensorsController < ApplicationController
  before_action :set_sensor
  before_action :set_data_collect
######## METODOS PARA API #######
  # # GET /sensors
  # def index
  #   @sensors = Sensor.all
  #   json_response(@sensors)
  # end
  #
  # # POST /sensors
  # def create
  #   @sensor = Sensor.create!(sensor_params)
  #   json_response(@sensor, :created)
  # end
  #
  # # GET /sensors/:id
  # def show
  #   json_response(@sensor)
  # end
  #
  # # PUT /sensors/:id
  # def update
  #   @sensor.update(sensor_params)
  #   head :no_content
  # end
  #
  # # DELETE /sensors/:id
  # def destroy
  #   @sensor.destroy
  #   head :no_content
  # end
  ######## METODOS PARA API #######
  def show
    @sensors = Sensor.all
  end

  def set_sensor
    @sensor =  Sensor.find(params[:id])
  end

  def set_data_collect
    case @sensor.id
    when 1
      @data_collects  = DataCollect.where(sensor_id: Sensor.find_by(name: "TEMPDS").id).last(50)
    when 2
      @data_collects = DataCollect.where(sensor_id: Sensor.find_by(name: "PRESSURE").id).last(50)
    when 3
      @data_collects = DataCollect.where(sensor_id: Sensor.find_by(name: "CONCENTRATION").id).last(50)
    when 4
      @data_collects = DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id).last(50)
    when 5
      @data_collects = DataCollect.where(sensor_id: Sensor.find_by(name: "ENTRY").id).last(50)
    when 6
      @data_collects = DataCollect.where(sensor_id: Sensor.find_by(name: "PH").id).last(50)
    else
      @data_collects = DataCollect.all
    end
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
