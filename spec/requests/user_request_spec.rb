require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before do
        post '/signup', params: {
          name: 'Mr Tester',
          email: 'tester@test.com',
          password: '123456',
          password_confirmation: '123456'
        }, headers: headers
      end

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      # rubocop:disable Layout/LineLength
      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Password digest can't be blank/)
      end
      # rubocop:enable Layout/LineLength
    end
  end
end
