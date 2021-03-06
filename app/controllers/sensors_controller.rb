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
    case @sensor.name

    when "TEMPDS"
      datas = DataCollect.where(sensor_id: Sensor.find_by(name: "TEMPDS").id).last(50)
      @data_collects = formatTime(datas)

      @yAxis = "Temperatura (ºC)"
      @suffix = "ºC"
    when "CONCENTRATION"
      datas = DataCollect.where(sensor_id: Sensor.find_by(name: "CONCENTRATION").id).last(50)
      @data_collects = formatTime(datas)

      @yAxis = "Concentração (ppm)"
      @suffix = "ppm"
    when "PRESSURE"
      datas = DataCollect.where(sensor_id: Sensor.find_by(name: "PRESSURE").id).last(50)
      @data_collects = formatTime(datas)

      @yAxis = "Pressão (kPa)"
      @suffix = "kPa"
    when "LEVEL"
      datas = DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id).last(50)
      @data_collects = formatTime(datas)

      @yAxis = "Volume (cm³)"
      @suffix = "cm³"
    when "PH"
      datas = DataCollect.where(sensor_id: Sensor.find_by(name: "PH").id).last(50)
      @data_collects = formatTime(datas)

      @yAxis = "pH"
      @suffix = ""
    when "ENTRY"
      @data_collects = DataCollect.where(sensor_id: Sensor.find_by(name: "ENTRY").id).last(50)
    else
      @data_collects = DataCollect.all
    end
  end

  def get_last_value
    id = params[:id]
    ultimoColetaDoSensor = DataCollect.where(sensor_id:id).last
    valor = nil
    if ultimoColetaDoSensor
      valor = ultimoColetaDoSensor.value
    else
      valor = nil
    end
    json_response(valor)
  end

  def one_sensor_last_fifty
   id = params[:id]
   datas = DataCollect.where(sensor_id: id).last(50)
   datas = formatTime(datas)
   render json: datas.pluck(:data_measure, :value)
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
