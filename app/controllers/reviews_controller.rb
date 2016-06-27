class ReviewsController < ApplicationController
	def new
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.new
	end

	def create
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.build(review_params)

		if @review.save
			redirect_to movie_path(@movie, @review), info: "Successfully posted new review."
		else
			render :new
		end
	end

	private

	def review_params
		params.require(:review).permit(:rating, :comment)
	end
end
