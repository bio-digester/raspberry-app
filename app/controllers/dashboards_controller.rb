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
    return dataCollectedFromSensorsWithName
  end

  def get_last_fifty
    id = params[:id]
    level = DataCollect.where(sensor_id: id).last(50)
    render json: level.pluck(:data_measure, :value)
  end

  def get_last_notification
    @notifications = Notification.where(visualized: false)
    respond_to do |format|
      format.html { redirect_to root_path, alert: @notifications }
    end
  end

end
