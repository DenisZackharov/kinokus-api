module Api
  module V1
    class MoviesController < ApplicationController
      def index
        @movies = Movie.includes(:poster_attachment)

        render jsonapi: @movies
      end

      def show
        @movie = Movie.find(params[:id])

        render jsonapi: @movie
      end
    end
  end
end
