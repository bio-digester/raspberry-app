class DashboardsController < ApplicationController

  def index
    @sensors = Sensor.all
    @data_collects = DataCollect.all
    @temperature = DataCollect.where(sensor_id: Sensor.find_by(name: "TEMPDS").id)
    @pressure = DataCollect.where(sensor_id: Sensor.find_by(name: "PRESSURE").id)
    @methane_gas = DataCollect.where(sensor_id: Sensor.find_by(name: "CONCENTRATION").id)
    @level = DataCollect.where(sensor_id: Sensor.find_by(name: "LEVEL").id)
    @water_flux = DataCollect.where(sensor_id: Sensor.find_by(name: "ENTRY").id)
    @ph = DataCollect.where(sensor_id: Sensor.find_by(name: "PH").id)
  end

end
