require 'rails_helper'

RSpec.describe 'Measurement API' do
  # Initialize the test data
  let(:user) { create(:user) }
  let!(:measure) { create(:measure) }
  let!(:measurement) { create_list(:measurement, 6, value: 20, user_id: user.id, measure_id: measure.id) }
  let(:id) { measurement.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /api/v1/measurement
  describe 'GET /api/v1/measurement' do
    before { get '/api/v1/measurement', params: {}, headers: headers }

    context 'when measure exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns all measure measurement' do
        expect(json.size).to eq(1)
      end
    end

    context 'when measure does not exist' do
      before { get '/api/v1/measurement', params: {}, headers: invalid_headers }

      it 'returns status code 404' do
        expect(response).to have_http_status(422)
      end
      it 'returns a not found message' do
        expect(response.body).to match('{"message":"Missing token"}')
      end
    end
  end

  # Test suite for POST /api/v1/measurement
  describe 'POST /api/v1/measurement' do
    context 'when request attributes are valid' do
      before do
        post '/api/v1/measurement', params: {
          measurement: {
            value: '36',
            user_id: user.id,
            measure_id: measure.id
          }
        }, headers: headers
      end
      # json = JSON.parse(response.body).deep_symbolize_keys

      # it 'Creates a new measurement' do
      #   expect(JSON.parse(response.body)[0]['value']).to eq(36)
      # end
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end

    context 'when an invalid request' do
      let(:invalid_data) { { value: nil }.to_json }
      before { post '/api/v1/measurement', params: invalid_data, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Measure must exist, Value can't be blank, Measure can't be blank/)
      end
    end
  end
end
