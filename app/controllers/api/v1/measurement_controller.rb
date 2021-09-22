module Api
  module V1
    class MeasurementController < ApplicationController
      # GET /measurement
      def index
        @measurements = current_user.measurements.all.order(created_at: :DESC)
        json_response(MeasurementSerializer.new(@measurements).serialized_json)
      end

      # POST /measurements
      def create
        @measure = current_user.measurements.create!(measurement_params)
        response = { message: Message.measurement_created }
        # json_response(MeasurementSerializer.new(@measure, response).serialized_json)
        json_response(response, :created)
      end

      private

      def measurement_params
        params.permit(:value, :user_id, :measure_id)
      end
    end
  end
end
