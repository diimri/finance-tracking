class StocksController < ApplicationController

	def search
		if params[:stock].present?
			@stock = Stock.current_price(params[:stock])#weak paramerters
			if @stock
			render 'users/my_portfolio'#we need to tell which page its gonna be in
			else 
			flash[:alert] ="Please enter a valid symbol"
			redirect_to my_portfolio_path
			end
		else
			flash[:alert]="Please enter a symbol to search"
			redirect_to my_portfolio_path
		end
	end

end

#later add strong parameters under private.