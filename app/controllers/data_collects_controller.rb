class DataCollectsController < ApplicationController
  before_action :set_sensor
  before_action :set_sensor_data_collect, only: [:show, :api_show, :api_update, :api_destroy]

  # GET /sensor/:sensor_id/data_collects
  def index
    list = []
    @sensor.data_collect.all.each do |d|
      list.push([d.data_measure.to_i * 1000, d.value.to_f])
    end
    json_response(list)
  end

  # GET api/sensor/:sensor_id/data_collects
  def api_index
    json_response(@sensor.data_collect)
  end

  # GET api/sensor/:sensor_id/data_collects/:id
  def api_show
    json_response(@data_collect)
  end

  # POST api/sensors/:sensor_id/data_collects
  def api_create
    @sensor.data_collect.create!(data_collect_params)
    json_response(@sensor, :created)
  end

  # PUT api/sensors/:sensor_id/data_collects/:id
  def api_update
    @data_collect.update(data_collect_params)
    head :no_content
  end

  # DELETE api/sensors/:sensor_id/data_collects/:id
  def api_destroy
    @data_collect.destroy
    head :no_content
  end

  private

  def data_collect_params
    params.permit(:data_measure, :value)
  end

  def set_sensor
    @sensor = Sensor.find(params[:sensor_id])
  end

  def set_sensor_data_collect
    @data_collect = @sensor.data_collect.find_by!(id: params[:id]) if @sensor
  end
end
