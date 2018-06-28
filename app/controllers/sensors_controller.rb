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
      datas = DataCollect.where(sensor_id: Sensor.find_by(name: "TEMPDS").id).last(50)
      @data_collects = formatTime(datas)

      @yAxis = "Temperatura (ºC)"
      @suffix = "ºC"
    when 2
      datas = DataCollect.where(sensor_id: Sensor.find_by(name: "CONCENTRATION").id).last(50)
      @data_collects = formatTime(datas)

      @yAxis = "Concentração (ppm)"
      @suffix = "ppm"
    when 3
      datas = DataCollect.where(sensor_id: Sensor.find_by(name: "PRESSURE").id).last(50)
      @data_collects = formatTime(datas)

      @yAxis = "Pressão (kPa)"
      @suffix = "kPa"
    when 4
      datas = DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id).last(50)
      @data_collects = formatTime(datas)

      @yAxis = "Volume (cm³)"
      @suffix = "cm³"
    when 5
      datas = DataCollect.where(sensor_id: Sensor.find_by(name: "PH").id).last(50)
      @data_collects = formatTime(datas)

      @yAxis = "pH"
      @suffix = ""
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

  private
  def formatTime(datas)
    datas.each { |data|
      y = data.data_measure.to_s
      values = y.split(" ")
      dayMonthYear = formatToBrazilianTime(values[0])
      data.data_measure = dayMonthYear + ' | ' + values[1]
    }
    datas
  end

  def formatToBrazilianTime(unformatedData)
    values = unformatedData.split("-")
    formatedData = values[2] + "-" + values[1] + "-" + values[0]
    formatedData
  end

end
