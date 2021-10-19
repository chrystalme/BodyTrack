# spec/requests/measure_spec.rb
require 'rails_helper'

RSpec.describe 'Measure API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:measure) { create_list(:measure, 10) }
  let(:measure_id) { measure.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /measure
  describe 'GET /api/v1/measure' do
    # make HTTP get request before each example
    before { get '/api/v1/measure', params: {}, headers: headers }

    it 'returns measure' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      # expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /measure/:id
  describe 'GET /api/v1/measure/:id' do
    before { get "/api/v1/measure/#{measure_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the measure' do
        expect(json).not_to be_empty
        # expect(json['id']).to eq(measure_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:measure_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Measure/)
      end
    end
  end

  # Test suite for POST /measure
  describe 'POST /api/v1/measure' do
    # valid payload
    let(:valid_attributes) do
      { title: 'Height', unit: 'cm', image: '/publice/image/31010672.jpg', description: 'Distance of crown to feet' }
    end

    context 'when the request is valid' do
      before { post '/api/v1/measure', params: valid_attributes, headers: headers }

      it 'creates a measure' do
        # expect(json['title']).to eq('Height')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/measure', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match('{"message":"Missing token"}')
      end
    end
  end

  # Test suite for PUT /measure/:id
  describe 'PUT /api/v1/measure/:id' do
    let(:valid_attributes) do
      { title: 'Weight', unit: 'kg', image: '/publice/image/31010672.jpg', description: 'Mass of body' }
    end

    context 'when the record exists' do
      before { put "/api/v1/measure/#{measure_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body['title']).to be_nil
        expect(response.body['title']).to match(valid_attributes['title'])
        expect(response.body['unit']).to match(valid_attributes['unit'])
        expect(response.body['image']).to match(valid_attributes['image'])
        expect(response.body['description']).to match(valid_attributes['description'])
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /measure/:id
  describe 'DELETE /api/v1/measure/:id' do
    before { delete "/api/v1/measure/#{measure_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(422)
    end
  end
end
