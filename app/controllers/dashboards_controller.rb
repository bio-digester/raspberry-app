class DashboardsController < ApplicationController

  def index
    @sensors = Sensor.all
    @data_collects = DataCollect.all
    @temperature = DataCollect.where(sensor_id: Sensor.find_by(name: "temperature").id)
    @pressure = DataCollect.where(sensor_id: Sensor.find_by(name: "pressure").id)
    @methane_gas = DataCollect.where(sensor_id: Sensor.find_by(name: "methane_gas").id)
    @level = DataCollect.where(sensor_id: Sensor.find_by(name: "level").id)
    @water_flux = DataCollect.where(sensor_id: Sensor.find_by(name: "water_flux").id)
    # @ph = DataCollect.where(sensor_id: Sensor.find_by(name: "ph").id)
    @dataCollectedFromSensorsWithName = getDataCollectedFromSensorsWithName
  end

  def getDataCollectedFromSensorsWithName
    dataCollectedFromSensors = DataCollect.group(:sensor_id).count
    dataCollectedFromSensorsWithName = Array.new
    for sensor in dataCollectedFromSensors do
      dataCollectedFromSensorsWithName.push([Sensor.find(sensor[0]).name, sensor[1]])
    end
    return dataCollectedFromSensorsWithName
  end

  def get_temperature
    temperature = DataCollect.where(sensor_id: Sensor.find_by(name: "temperature").id)
    render json: temperature.pluck(:data_measure, :value)
  end

end
