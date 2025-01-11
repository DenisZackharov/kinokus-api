module Api
  module V1
    class ApplicationController < ActionController::API
      before_action :underscore_params!

      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      private

      def underscore_params!
        params.deep_transform_keys!(&:underscore)
      end

      def record_not_found(error)
        render json: { errors: error.message }, status: :not_found
      end
    end
  end
end
