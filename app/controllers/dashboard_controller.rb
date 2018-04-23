class DashboardController < ApplicationController
	def index

		@arrayCores = [
            "#abc123",
            "#112242",
            "#6571ba",
            "#abc123",
            "#fd2242",
            "#abc123",
            "#f12242"
        ];

        @valoresColuna = [
            90,
            44,
            56,
            70,
            90,
            70,
          	180
        ];


		render "index"
	end
end
