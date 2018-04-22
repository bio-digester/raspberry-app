class DashboardController < ApplicationController
	def index

		@arrayCores = [
            "#abc123",
            "#fff234"
        ];

        @valoresColuna = [
            70,
            130
        ];


		render "index"
	end
end
