module Api
  module V1
    class MoviesController < ApplicationController
      def index
        @movies = Movie.all

        render jsonapi: @movies
      end

      def show
        @movie = Movie.find(params[:id])

        render jsonapi: @movie
      end
    end
  end
end
