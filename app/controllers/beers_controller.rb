class BeersController < ApplicationController

	def index
		@beers = Beer.all
	end

	def show
		@beer = Beer.find_by(id: params[:id])
		@review = Review.new
	end

	def new
		@beer = Beer.new
		@beer.build_brewery
	end

	def create
		# raise params.inspect
		@beer = Beer.new(beer_params)
		# using .save! will cause an error but will tell you what the error is
		if @beer.save
			redirect_to beer_path(@beer)
		else
			render :new
		end
	end

	def edit
		@beer = Beer.find(params[:id])
	end

	def update
		@beer = Beer.find(params[:id])
	end

	private

	def beer_params
		params.require(:beer).permit(:name, :style, :tasting_notes, :user_id, :brewery_id, brewery_attributes: [:name, :in_store])
	end

end
