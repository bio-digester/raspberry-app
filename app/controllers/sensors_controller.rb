class SensorsController < ApplicationController
  before_action :set_sensor, except: [:api_index, :api_create]
  before_action :set_data_collect, only: [:show]

######## METODOS PARA API #######
  # # GET api/sensors
  def api_index
    @sensors = Sensor.all
    json_response(@sensors)
  end
  #
  # # POST api/sensors
  def api_create
    @sensor = Sensor.create!(sensor_params)
    json_response(@sensor, :created)
  end
  #
  # GET api/sensors/:id
  def api_show
    json_response(@sensor)
  end
  #
  # # PUT api/sensors/:id
  def api_update
    @sensor.update(sensor_params)
    head :no_content
  end
  #
  # # DELETE api/sensors/:id
  def api_destroy
    @sensor.destroy
    head :no_content
  end
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
      @yAxis = "Temperatura (ºC)"
    when 2
      @data_collects = DataCollect.where(sensor_id: Sensor.find_by(name: "CONCENTRATION").id).last(50)
      @yAxis = "Concentração (ppm)"
    when 3
      @data_collects = DataCollect.where(sensor_id: Sensor.find_by(name: "PRESSURE").id).last(50)
      @yAxis = "Pressão (kPa)"
    when 4
      @data_collects = DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id).last(50)
      @yAxis = "Volume (cm³)"
    when 5
      @data_collects = DataCollect.where(sensor_id: Sensor.find_by(name: "PH").id).last(50)
      @yAxis = "pH"
    when 6
      @data_collects = DataCollect.where(sensor_id: Sensor.find_by(name: "ENTRY").id).last(50)
    else
      @data_collects = DataCollect.all
    end
  end

  def get_last_value
    id = params[:id]
    valor = DataCollect.where(sensor_id:id).last.value
    json_response(valor)
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
