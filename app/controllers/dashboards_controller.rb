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
