class PaymentSelectController < ApplicationController
	def select_plan
		@pelicula_id = Pelicula.find(params[:pelicula])
	end

	def select_monthly_subscription
	end
end
