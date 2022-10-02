class StocksController < ApplicationController

	def search
		@stock = Stock.current_price(params[:stock])
		render json: @stock
	end

end