class DataCollectsController < ApplicationController
  before_action :set_sensor
  before_action :set_sensor_data_collect, only: [:show, :update, :destroy]

 # GET /sensor/:sensor_id/data_collects
 def index
   json_response(@sensor.data_collect)
 end

 # GET /sensor/:sensor_id/data_collects/:id
 def show
   json_response(@data_collect)
 end

 # POST /sensors/:sensor_id/data_collects
 def create
   @sensor.data_collect.create!(data_collect_params)
   json_response(@sensor, :created)
 end

 # PUT /sensors/:sensor_id/data_collects/:id
 def update
   @data_collect.update(data_collect_params)
   head :no_content
 end

 # DELETE /sensors/:sensor_id/data_collects/:id
 def destroy
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
