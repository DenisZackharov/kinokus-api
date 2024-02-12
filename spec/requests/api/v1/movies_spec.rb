require "swagger_helper"

RSpec.describe "api/v1/movies", type: :request do
  path "/api/v1/movies" do
    get("list movies") do
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end

  path "/api/v1/movies/{id}" do
    parameter name: "id", in: :path, type: :integer, description: "id"

    get("show movie") do
      response(200, "successful") do
        let(:id) { 123 }
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end
end
