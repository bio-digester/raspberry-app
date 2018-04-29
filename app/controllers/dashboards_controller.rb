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
  end

end
