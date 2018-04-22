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
            70,
            44,
            56,
            70,
            44,
            70,
          	34
        ];


		render "index"
	end
end
