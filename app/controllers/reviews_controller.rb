class ReviewsController < ApplicationController

	def index
	end

	def new
		@beer = Beer.find_by(id: params[:beer_id])
		@review = @beer.reviews.build
	end

	def create
		# raise params.inspect
		@review = Review.new(review_params)
		if @review.save
			redirect_to beer_path(@review.beer)
		else
			render :new
		end
	end

	def edit
		@review = Review.find_by(id: params[:id])	
	end

	def update
		@review = Review.find_by(id: params[:id])
		if @review.update(review_params)
			redirect_to beer_path(@review.beer)
		else
			render :edit
		end
	end

	private

	def review_params
		params.require(:review).permit(:title, :stars, :content, :user_id, :beer_id)
	end
end
