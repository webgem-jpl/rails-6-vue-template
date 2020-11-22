require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    { email: 'jean-claude.vandam@gmail.com', password: 'qwerty' }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    context 'user is logged in' do
      login_user

      it 'returns a success response - when sign in' do
        User.create!(valid_attributes)
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'GET #index' do
    context 'user is logged out' do
      logout_user

      it 'redirect to sign in page' do
        get :index, params: {}
        expect(response).to have_http_status(302)
      end
    end
  end
end
