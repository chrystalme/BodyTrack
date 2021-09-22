require 'rails_helper'

RSpec.describe 'Authentication API', type: :request do
  # Authentication test suite
  describe 'POST /auth/login' do
    # create test user
    let!(:user) { create(:user) }
    # set headers for authorization
    let(:headers) { valid_headers.except('Authorization') }
    # set test valid and invalid credentials
    let(:valid_credentials) do
      {
        email: user.email,
        password: user.password
      }
    end

    # set request.headers to our custon headers
    # before { allow(request).to receive(:headers).and_return(headers) }

    # returns auth token when request is valid
    context 'When request is valid' do
      before { post '/auth/login', params: valid_credentials, headers: headers }

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end

      it 'returns valid status' do
        expect(response.status).to eq(200)
      end

      it 'returns a failure message' do
        expect(response.status).not_to eq(401)
      end
    end

    # returns failure message when request is invalid
    context 'When request is invalid' do
      before do
        post '/auth/login', params: {
          email: 'mytest@test.com',
          password: 'fake_password'
        }, headers: headers
      end

      it 'returns a failure code' do
        expect(response.status).to eq(401)
      end

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
