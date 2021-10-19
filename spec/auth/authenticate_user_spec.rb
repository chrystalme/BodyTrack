require 'rails_helper'

RSpec.describe AuthenticateUser do
  # create user
  let(:user) { create(:user) }
  # valid request subject
  subject(:valid_auth_obj) { described_class.new(user.email, user.password) }
  # invalid request subject
  subject(:invalid_auth_obj) { described_class.new('foo', 'bar') }

  # Test suite for AuthenticateUser#call
  describe '#call' do
    # return token when request is valid
    context 'when request is valid' do
      it 'return an auth token' do
        token = valid_auth_obj.call
        expect(token).not_to be_nil
      end
    end
  end

  #  raise Authentication Error when request is invalid
  context 'when request is invalid' do
    it 'raises an authentication error' do
      expect { invalid_auth_obj.call }
        .to raise_error(
          ExceptionHandler::AuthenticationError,
          /Invalid credentials/
        )
    end
  end
end
