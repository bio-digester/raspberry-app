class DashboardsController < ApplicationController
  # before_action :index, only: [:get_last_notification]
  def index
    @sensors = Sensor.all
    @data_collects = DataCollect.all
    @temperature = DataCollect.where(sensor_id: Sensor.find_by(name: "TEMPDS").id).last(50)
    @pressure = DataCollect.where(sensor_id: Sensor.find_by(name: "PRESSURE").id).last(50)
    @methane_gas = DataCollect.where(sensor_id: Sensor.find_by(name: "CONCENTRATION").id).last(50)
    @level = DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id).last(50)
    @ph = DataCollect.where(sensor_id: Sensor.find_by(name: "PH").id).last(50)
    @dataCollectedFromSensorsWithName = getDataCollectedFromSensorsWithName
  end

  def getDataCollectedFromSensorsWithName
    dataCollectedFromSensors = DataCollect.group(:sensor_id).count
    dataCollectedFromSensorsWithName = Array.new
    for sensor in dataCollectedFromSensors do
      dataCollectedFromSensorsWithName.push([Sensor.find(sensor[0]).codename, sensor[1]])
    end
    dataCollectedFromSensorsWithName
  end

 def get_last_fifty
   id = params[:id]
   datas = DataCollect.where(sensor_id: id).last(50)
   datas = formatTime(datas)
   render json: datas.pluck(:data_measure, :value)
 end

  def get_last_fifty_all
	temperaturaId = Sensor.find_by_name("TEMPDS").id
  temperatura = DataCollect.where(sensor_id: temperaturaId).last(50)
	temperatura = formatTime(temperatura)

  concentracaoId = Sensor.find_by_name("CONCENTRATION").id
  concentracao = DataCollect.where(sensor_id: concentracaoId).last(50)
	concentracao = formatTime(concentracao)

  pressaoId = Sensor.find_by_name("PRESSURE").id
  pressao = DataCollect.where(sensor_id: pressaoId).last(50)
  pressao = formatTime(pressao)

  volumeId = Sensor.find_by_name("LEVEL").id
  volume = DataCollect.where(sensor_id: volumeId).last(50)
  volume = formatTime(volume)

  phId = Sensor.find_by_name("PH").id
  ph = DataCollect.where(sensor_id: phId).last(50)
  ph = formatTime(ph)
  render json: [
                {name: ["Temperatura (ºC)"], data: temperatura.pluck(:data_measure, :value, :sensor_id) },
                {name: ["Concentração (ppm)"], data: concentracao.pluck(:data_measure, :value, :sensor_id) },
                {name: ["Pressão (kPa)"], data: pressao.pluck(:data_measure, :value, :sensor_id) },
                {name: ["Volume (cm³)"], data: volume.pluck(:data_measure, :value, :sensor_id) },
                {name: ["pH"], data: ph.pluck(:data_measure, :value, :sensor_id) }, 
               ]
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
