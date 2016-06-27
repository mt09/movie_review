class ReviewsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def new
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.new
	end

	def create
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.build(review_params)
		@review.user_id = current_user.id

		if @review.save
			redirect_to movie_path(@movie, @review), warning: "New review has been posted successfully."
		else
			render :new
		end
	end

	private

	def review_params
		params.require(:review).permit(:rating, :comment)
	end
end
