module Api
  module V1
    class MoviesController < ApplicationController
      def index
        @movies = Movie.with_attached_poster

        render jsonapi: @movies
      end

      def show
        @movie = Movie.find(params[:id])

        render jsonapi: @movie
      end
    end
  end
end
