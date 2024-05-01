require "swagger_helper"

describe "api/v1/movies", type: :request do
  path "/api/v1/movies" do
    get "list movies" do
      tags "Movies"
      produces "application/json"

      let!(:first_movie) { create :movie }
      let!(:second_movie) { create :movie }

      response 200, "successful" do
        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body["data"].count).to eq(2)
        end
      end
    end
  end

  path "/api/v1/movies/{id}" do
    get "show movie" do
      tags "Movies"
      parameter name: "id", in: :path, type: :integer, description: "id"
      produces "application/json"

      let!(:movie) { create :movie, name: "Lord of the rings" }

      response 200, "movie found" do
        let(:id) { movie.id }

        run_test!
      end
    end
  end
end
