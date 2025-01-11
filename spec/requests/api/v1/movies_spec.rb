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
          expect(body.count).to eq(2)
        end
      end
    end

    post "create movie" do
      tags "Movies"
      consumes "application/json"
      parameter name: :movie, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          annotation: { type: :string },
          durationInMinutes: { type: :integer },
          releaseDate: { type: :string, format: :date }
        },
        required: %w[name]
      }

      let(:movie) do
        { name: "Inception", description: "A mind-bending thriller", annotation: "Annotation", duration_in_minutes: 120,
          release_date: "2010-07-16" }
      end

      response 200, "movie created" do
        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body["name"]).to eq("Inception")
        end
      end

      response 422, "invalid request" do
        let(:movie) { { name: nil, description: nil } }

        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body["errors"]).not_to be_empty
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

    put "update movie" do
      tags "Movies"
      parameter name: "id", in: :path, type: :integer, description: "id"
      consumes "application/json"
      parameter name: :movie, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          annotation: { type: :string },
          durationInMinutes: { type: :integer },
          releaseDate: { type: :string, format: :date }
        }
      }

      let!(:existing_movie) { create :movie, name: "Old Name" }
      let(:id) { existing_movie.id }
      let(:movie) { { name: "Updated Name" } }

      response 200, "movie updated" do
        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body["name"]).to eq("Updated Name")
        end
      end

      response 422, "invalid request" do
        let(:movie) { { name: nil } }

        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body["errors"]).not_to be_empty
        end
      end
    end

    delete "destroy movie" do
      tags "Movies"
      parameter name: "id", in: :path, type: :integer, description: "id"
      produces "application/json"

      let!(:movie_to_delete) { create :movie }
      let(:id) { movie_to_delete.id }

      response 200, "movie deleted" do
        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body["message"]).to eq("Movie successfully destroyed!")
          expect(Movie).not_to exist(id)
        end
      end

      response 404, "movie not found" do
        let(:id) { 0 }

        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body["errors"]).not_to be_empty
        end
      end
    end
  end
end
