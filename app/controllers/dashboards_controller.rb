class DashboardsController < ApplicationController

  def index
    @sensors = Sensor.all
    @data_collects = DataCollect.all
    @temperature = DataCollect.where(sensor_id: Sensor.find_by(name: "TEMPDS").id)
    @pressure = DataCollect.where(sensor_id: Sensor.find_by(name: "PRESSURE").id)
    @methane_gas = DataCollect.where(sensor_id: Sensor.find_by(name: "CONCENTRATION").id)
    @level = DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id)
    @ph = DataCollect.where(sensor_id: Sensor.find_by(name: "PH").id)
    @dataCollectedFromSensorsWithName = getDataCollectedFromSensorsWithName
  end

  def getDataCollectedFromSensorsWithName
    dataCollectedFromSensors = DataCollect.group(:sensor_id).count
    dataCollectedFromSensorsWithName = Array.new
    for sensor in dataCollectedFromSensors do
      dataCollectedFromSensorsWithName.push([Sensor.find(sensor[0]).codename, sensor[1]])
    end
    return dataCollectedFromSensorsWithName
  end

  def get_temperature
    temperature = DataCollect.where(sensor_id: Sensor.find_by(name: "TEMPDS").id)
    render json: temperature.pluck(:data_measure, :value)
  end

end
