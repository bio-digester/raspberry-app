class DataCollectsController < ApplicationController
  before_action :set_sensor
  before_action :set_data_collect, only: [:show, :edit, :update, :destroy]

  # GET /data_collects
  # GET /data_collects.json
  def index
    @data_collects = DataCollect.all
  end

  # GET /data_collects/1
  # GET /data_collects/1.json
  def show
  end

  # GET /data_collects/new
  def new
    @data_collect = DataCollect.new
  end

  # GET /data_collects/1/edit
  def edit
  end

  # POST /data_collects
  # POST /data_collects.json
  def create
    @data_collect = DataCollect.new(data_collect_params)
    @data_collect.sensor = @sensor
    respond_to do |format|
      if @data_collect.save
        format.html { redirect_to sensor_data_collects_path(@data_collect), notice: 'Data collect was successfully created.' }
        format.json { render :show, status: :created, location: @data_collect }
      else
        format.html { render :new }
        format.json { render json: @data_collect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_collects/1
  # PATCH/PUT /data_collects/1.json
  def update
    respond_to do |format|
      if @data_collect.update(data_collect_params)
        format.html { redirect_to @data_collect, notice: 'Data collect was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_collect }
      else
        format.html { render :edit }
        format.json { render json: @data_collect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_collects/1
  # DELETE /data_collects/1.json
  def destroy
    @data_collect.destroy
    respond_to do |format|
      format.html { redirect_to data_collects_url, notice: 'Data collect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_sensor
      @sensor = Sensor.find(params[:sensor_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_data_collect
      @data_collect = DataCollect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_collect_params
      params.require(:data_collect).permit(:data_measure, :value)
    end
end
