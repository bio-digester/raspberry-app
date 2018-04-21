class DashboardController < ApplicationController
	def index
		@sensors = Sensor.all

		render "index"
	end
end
