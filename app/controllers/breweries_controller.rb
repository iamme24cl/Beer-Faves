class BreweriesController < ApplicationController

	def index
		@brewery = Brewery.all
	end

	def new
		@brewery = Brewery.new
	end

	def create
		@brewery = Brewery.new(brewery_params)
		if @brewery.save
			redirect_to brewery_path(@brewery)
		else
			render :new
		end
	end

	def edit
		@brewery = Brewery.find(params[:id])
	end

	def update
		@brewery = Brewery.find(params[:id])
	end

	private

	def brewery_params
		params.require(:brewery).permit(:name, :in_store)
	end

end
