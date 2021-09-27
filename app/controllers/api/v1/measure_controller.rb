module Api
  module V1
    class MeasureController < ApplicationController
      before_action :set_measure, only: %i[show update destroy]

      # GET /measures
      def index
        @measures = Measure.all
        # json_response(MeasureSerializer.new(@measures, options).serialized_json)
        json_response(@measures)
      end

      # POST /measures
      def create
        @measure = Measure.create!(measure_params)
        json_response(MeasureSerializer.new(@measure).serialized_json, :created)
      end

      # GET /measures/:id
      def show
        json_response(MeasureSerializer.new(@measure, options).serialized_json)
      end

      # PUT /measures/:id
      def update
        @measure.update(measure_params)
        head :no_content
      end

      # DELETE /measures/:id
      def destroy
        @measure.destroy
        head :no_content
      end

      private

      def measure_params
        params.permit(:title, :unit, :description, :image)
      end

      def set_measure
        @measure = Measure.find(params[:id])
      end

      def options
        @options ||= { includes: [:measurements] }
      end
    end
  end
end
