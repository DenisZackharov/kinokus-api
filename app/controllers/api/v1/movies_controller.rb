module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: %i[show update destroy]

      def index
        movies = Movie.with_attached_poster

        render json: ::MovieBlueprint.render_as_json(movies)
      end

      def show
        render json: ::MovieBlueprint.render_as_json(@movie)
      end

      def create
        movie = Movie.new(movie_params)

        if movie.save
          render json: ::MovieBlueprint.render_as_json(movie)
        else
          render json: { errors: movie.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @movie.update(movie_params)
          render json: ::MovieBlueprint.render_as_json(@movie)
        else
          render json: { errors: @movie.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @movie.destroy

        render json: { message: "Movie successfully destroyed!" }, status: :ok
      end

      private

      def set_movie
        @movie = Movie.find(params[:id])
      end

      def movie_params
        params.require(:movie).permit(:name, :description, :annotation, :duration_in_minutes, :release_date)
      end
    end
  end
end
