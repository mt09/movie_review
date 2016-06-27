class MoviesController < ApplicationController
	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params)

		if @movie.save
			redirect_to movies_path, info: "nice movie"
		else
			render :new
		end
	end

	private

	def movie_params
		params.require(:movie).permit(:title, :description, :movie_length, :director, :rating,
																	:image)
	end
end
