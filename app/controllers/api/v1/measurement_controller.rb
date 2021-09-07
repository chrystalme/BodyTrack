module Api
  module V1
    class MeasurementController < ApplicationController
      before_action :set_measure
      before_action :set_measure_measurement, only: %i[show update destroy]

      # GET /measure/:measure_id/measurement
      def index
        @measurements = current_user.measurements.all
        json_response(MeasurementSerializer.new(@measurements).serialized_json)
      end

      # GET /measures/:measure_id/measurements/:id
      def show
        json_response(MeasurementSerializer.new(@measurement).serialized_json)
      end

      # POST /measures/:measure_id/measurements
      def create
        current_user.measurements.create!(measurement_params)
        json_response(MeasurementSerializer.new(@measure, :created).serialized_json)
      end

      # PUT /measures/:measure_id/measurements/:id
      def update
        @measurement.update(measurement_params)
        head :no_content
      end

      # DELETE /measures/:measure_id/measurements/:id
      def destroy
        @measurement.destroy
        head :no_content
      end

      private

      def measurement_params
        params.permit(:value, :date, :user_id, :measure_id)
      end

      def set_measure
        @measure = Measure.find(params[:measure_id])
      end

      def set_measure_measurement
        @measurement = @measure.measurements.find_by(id: :params[:id]) if @measure
      end
    end
  end
end
